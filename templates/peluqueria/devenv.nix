{ pkgs, ... }:

{
  packages = with pkgs; [
    nodejs_20
    nodePackages.pnpm

    python312
    python312Packages.pip
    python312Packages.virtualenv

    docker
    docker-compose

    git
  ];

  languages.javascript.enable = true;
  languages.python.enable = true;

  scripts = {

    init.exec = ''
      if [ ! -d backend ]; then
        echo "Creating FastAPI backend..."
        mkdir backend
        cd backend
        python -m venv .venv
        source .venv/bin/activate

        pip install fastapi uvicorn sqlmodel psycopg[binary]

        cat > main.py <<EOF
from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def root():
    return {"status": "ok"}
EOF
        cd ..
      fi

      if [ ! -d frontend ]; then
        echo "Creating React frontend..."
        pnpm create vite frontend --template react-ts
        cd frontend
        pnpm install
        pnpm add @tanstack/react-query zustand axios
        cd ..
      fi
    '';

    db-start.exec = ''
      docker compose up -d
    '';

    db-stop.exec = ''
      docker compose down
    '';

    backend-dev.exec = ''
      cd backend
      source .venv/bin/activate
      uvicorn main:app --reload
    '';

    frontend-dev.exec = ''
      cd frontend
      pnpm dev
    '';
  };

  enterShell = ''
    echo ""
    echo "💈 SaaS Turnera Devshell"
    echo ""

    echo "init           -> scaffold project"
    echo "db-start       -> start postgres"
    echo "backend-dev    -> run fastapi"
    echo "frontend-dev   -> run react"
    echo ""
  '';
}
