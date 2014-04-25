# Scala convenience functions

function mts() {
  mvn -Dsuites="$*" test
}

function mk-scala-dir() {
  echo "Starting buildout of new scala project"
  if ! [[ -z $1 ]]; then
    echo "... directory $1 was provided"
    if ! [[ -d $1 ]]; then
      echo "...... doesn't exist. building it"
      mkdir -p $1
    fi
    cd $1
  fi
  mkdir -p src/main/{resources,scala}
  mkdir -p test/{resources,scala}
  mkdir -p project/
  echo "... directories built"

  touch build.sbt
  printf 'name := "sample"\n\n' >> build.sbt
  printf 'version := "0.1-SNAPSHOT"\n\n' >>build.sbt
  printf 'scalaVersion := "2.10.3"\n' >> build.sbt
  echo "... build.sbt boilerplate added"

  touch project/build.properties
  echo "sbt.verison=0.13.2" >> project/build.properties

  touch project/plugins.sbt
  echo 'addSbtPlugin("com.github.mpeltonen" % "sbt-idea" % "1.6.0")\n\naddSbtPlugin("com.eed3si9n" % "sbt-assembly" % "0.11.2")' > project/plugins.sbt
  touch assembly.sbt
  echo 'import sbtassembly.Plugin._\nimport AssemblyKeys._\n\nassemblySettings\n\nmainClass in assembly := Some("com.example.boot")\n\njarName in assembly := "example-service.jar"' > assembly.sbt
  echo "... basic plugins added"

  touch src/main/scala/ohai.scala
  printf 'object Ohai {\n\tdef main(args: Array[String]) = println("Ohai!")\n}' >> src/main/scala/ohai.scala
  echo "... hi.scala placeholder created"

  echo "... done!\n"
  ls -al
  echo "\n***** Happy coding *****\n"
}
