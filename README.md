# docker-opencv-java

OpenCV for Java

This docker image generates all the OpenCV Java class files contained in a JAR file as well as the native dynamic library for Java OpenCV. This is a self-contained library that works with JNI and is required to run a Java OpenCV application.

## Usage

```sh
$ docker run --rm -it -v $(pwd):/gen adamgyulavari/opencv-java
```

You can use this image to run Java applications that are using the OpenCV native library.

## References

* http://docs.opencv.org/2.4/doc/tutorials/introduction/linux_install/linux_install.html
* http://docs.opencv.org/2.4/doc/tutorials/introduction/desktop_java/java_dev_intro.html
