{pkgs, ...}: let
  javaWrappers = pkgs.runCommandLocal "java-wrappers" {} ''
    mkdir -p $out/bin
    ln -s ${pkgs.jdk8}/bin/java $out/bin/java8
    ln -s ${pkgs.jdk8}/bin/javac $out/bin/javac8
    ln -s ${pkgs.jdk21}/bin/java $out/bin/java21
    ln -s ${pkgs.jdk21}/bin/javac $out/bin/javac21
    ln -s ${pkgs.jdk25}/bin/java $out/bin/java25
    ln -s ${pkgs.jdk25}/bin/javac $out/bin/javac25
    ln -s ${pkgs.jdk21}/bin/java $out/bin/java
    ln -s ${pkgs.jdk21}/bin/javac $out/bin/javac
  '';
in {
  home.packages = [javaWrappers];

  home.sessionVariables.JAVA_HOME = "${pkgs.jdk21}";
}
