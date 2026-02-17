{ pkgs, ... }:

{
  languages.javascript = {
    enable = true;
    npm.enable = true;
  };

  packages = with pkgs; [
    supabase-cli
    nodePackages.typescript-language-server
  ];

  scripts.init-project.exec = ''
    npm create vite@latest . -- --template react-ts
    npm install
    npm install @supabase/supabase-js \
                @tanstack/react-query \
                @tanstack/react-table \
                zustand \
                react-chartjs-2 \
                chart.js
    echo "✅ Stack completo instalado."
  '';

  enterShell = ''
    echo "🛠️  Entorno React-Supabase-TanStack cargado"
  '';
}
