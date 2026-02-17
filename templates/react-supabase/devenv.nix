{ pkgs, ... }:

{
  packages = with pkgs; [
    nodejs_20
    nodePackages.pnpm
    supabase-cli
    git
  ];

  languages.javascript.enable = true;

  services.supabase.enable = true;

  env = {
    SUPABASE_DB_PASSWORD = "postgres";
  };

  enterShell = ''
    echo "🚀 React + Supabase devshell"
    node -v
    supabase --version
  '';
}
