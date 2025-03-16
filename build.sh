echo "-------------------------------"
echo "------------BUILDING-----------"
echo "-------------------------------"
mkdir -p buildAllJars | true
y=3

for i in $(seq 5 $END); do
    if [[ $y > 6 ]]; then
        export JAVA_HOME="C:\Program Files\Eclipse Adoptium\jdk-21.0.6.7-hotspot"
    else
          export JAVA_HOME="C:\Program Files\Eclipse Adoptium\jdk-17.0.14.7-hotspot"
    fi

    echo "Using JAVA_HOME=$JAVA_HOME"

    ./gradlew build -Pindex="$y" || { echo "Build failed at $i"; exit 1; }

    ((y=y+1))

    mv ./*/build/libs/item-placer-2-*-*-*.jar "buildAllJars"
    ((y=y+1))
done

echo "-------------------------------"
echo "--------------DONE-------------"
echo "-------------------------------"
