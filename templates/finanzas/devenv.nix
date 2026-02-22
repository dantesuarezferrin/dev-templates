{ pkgs, config, lib, ...}:
{
  languages.java = {
    enable = true;
    jdk.package = pkgs.jdk21;
  };

  languages.java.gradle.enable = true;

  services.postgres = {
    enable = true;
    package = pkgs.postgresql_16;
    initialDatabases = [{ name = "finanzas_pro"; }];
  };

  env = {
    SPRING_DATASOURCE_URL = "jdbc:postgresql://localhost:5432/finanzas_pro";
    SPRING_DATASOURCE_USERNAME = "postgres";
    SPRING_DATASOURCE_PASSWORD = "";
  };
}