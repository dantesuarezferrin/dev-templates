{ pkgs, lib, config, ... }: {
  languages.python = {
    enable = true;
    venv.enable = true;
    venv.requirements = ./requirements.txt;
  };

  languages.javascript = {
    enable = true;
    npm.enable = true;
  };

  services.postgres = {
    enable = true;
    initialDatabases = [{ name = "peluqueria_db"; }];
    listen_addresses = "127.0.0.1";
  };

  packages = with pkgs; [
    nodePackages.typescript-language-server
    pyright
    just
  ];

  scripts.dev.exec = "npm run dev & python manage.py runserver";

  enterShell = ''
    echo "⚡ Entorno Fullstack de la Empresa Activo"
    echo "Base de datos 'peluqueria_db' lista en puerto 5432"
  '';
}
