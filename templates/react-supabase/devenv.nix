{ pkgs, ... }:

{
  packages = with pkgs; [
    nodejs_20
    nodePackages.pnpm
    supabase-cli
    git
  ];

  languages.javascript.enable = true;

  env = {
    NODE_ENV = "development";
  };

  scripts = {

    init.exec = ''
      if [ ! -f package.json ]; then
        echo "⚡ Creating React app..."
        pnpm create vite . --template react
        pnpm install
      fi
    '';

    supabase-start.exec = ''
      supabase start
    '';

    supabase-stop.exec = ''
      supabase stop
    '';
  };

  enterShell = ''
    echo ""
    echo "🚀 React + Supabase devshell"
    echo ""

    echo "Available commands:"
    echo "  init            -> create react app"
    echo "  supabase-start  -> start local stack"
    echo "  supabase-stop   -> stop it"
    echo ""
  '';
}

