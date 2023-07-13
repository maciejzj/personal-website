# My work

## Professional work

I work at KP Labs as a machine learning engineer. I deal with data analysis,
machine learning models prototyping, and deployment to cloud or embedded
devices. I also take care of MLOps infrastructure for data storage, processing
pipelines, experiments tracking, and reproducibility. I mostly work with image
data, especially satellite imagery.

---

## Academic work

I am a PhD student at Silesian University of Technology. I am researching deep
learning applications for satellite imagery quality enhancement with emphasis on
generalization capabilities and real-life performance in specific tasks.

Keywords: *deeep learning*, *super-resolution*, *data-fusion*, *remote-sensing*,
*task-driven super-resolution*, *segmentation*.

### Publications and conferences

* M. Ziaja et al., “Benchmarking Deep Learning for On-Board Space Applications,”
  Remote Sensing, vol. 13, no. 19, p. 3981, Oct. 2021, doi: 10.3390/rs13193981.

* B. Grabowski et al., "Are Cloud Detection U-Nets Robust Against in-Orbit Image
  Acquisition Conditions?," IGARSS 2022 - 2022 IEEE International Geoscience and
  Remote Sensing Symposium, Kuala Lumpur, Malaysia, 2022, pp. 239-242, doi:
  10.1109/IGARSS46834.2022.9884919.

* M. Ziaja, J. Nalepa and M. Kawulok, "Data Augmentation for Multi-Image
  Super-Resolution," IGARSS 2022 - 2022 IEEE International Geoscience and Remote
  Sensing Symposium, Kuala Lumpur, Malaysia, 2022, pp. 119-122, doi:
  10.1109/IGARSS46834.2022.9884609.

* B. Grabowski et al., "Towards Robust Cloud Detection in Satellite Images Using
  U-Nets," IGARSS 2021 - 2021 IEEE International Geoscience and Remote Sensing
  Symposium, Brussels, Belgium, 2021.

### Preprints

* Kawulok et al., "Hyperspectral Image Pansharpening: the PRISMA Case Study,"
  IGARSS 2023 - 2023 IEEE International Geoscience and Remote Sensing Symposium,
  Pasadena, California, USA, 2023.

* Ziaja et al., "Hyperspectral Image Pansharpening: the PRISMA Case Study,"
  IGARSS 2023 - 2023 IEEE International Geoscience and Remote Sensing Symposium,
  Pasadena, California, USA, 2023.

* P. Kowaleczko et al., "MuS2: A Real-World Benchmark for Sentinel-2
  Multi-Image Super-Resolution".

* B. Grabowski et al., "Squeezing nnU-Nets with Knowledge Distillation for
  On-Board Cloud Detection".

### Lectures

I give a sneak-peak lesson on machine learning applied to satellite imagery
lesson. The resources are available in form of a Jupyter
[Notebook](https://github.com/maciejzj/ml-earth-observation-101).

---

## Personal projects

### IT Jobs Meta

Late 2022

Data pipeline and meta-analysis dashboard for IT job postings from the web.

Used technologies:

* Pandas
* Plotly & Dash
* AWS with Terraform and Ansible

Source code available at [GitHub](https://github.com/maciejzj/it-jobs-meta),
deployment available [online](https://itjobsmeta.net).

### Algorithms for autonomous vehicles – Kalman filter based AHRS system

Late 2021

Kalman filter based AHRS system implementation for embedded devices in form of a
standalone library and an example use case with Raspberry Pi and Pololu Minimu-9
v5.

Used technologies:

* Modern C++.
* Google Test and Google Mock for unit testing.
* CMake build system and GitLab Continuous Integration service.

Sources available at GitHub for: Kalman filter
[library](https://github.com/maciejzj/kalman-ahrs), Minimu-9 device
[reader](https://github.com/maciejzj/minimu) over I2C,
[AHRS system](https://github.com/maciejzj/minimu-ahrs) on Raspberry Pi
with Minimu-9.

### Software development system for Silesian Aerospace Systems students club

Mid 2021

A setup of libraries, hardware abstraction code pieces, CI/CD and software
quality tools as a base for aerospace embedded devices development.

Used technologies:

* Modern C++ in embedded devices.
* Google Test and Google Mock for unit testing.
* FreeRTOS operating system.
* CMake build system and GitLab Continuous Integration service.
* STM32 microcontroller programming with Libopencm3.

### Copper grains classification

Early 2020

Classification of copper grains based on active thermography and neural
networks. Consists in data gathering with thermal camera, data analysis, neural
network design and method evaluation. My bachelor's degree project and topic of
my thesis.

Used technologies:

* Python with PEP8 adherence.
* Jupyter notebooks.
* Scikit-image image processing library.
* Scikit-learn machine learning library.
* Tensorflow and Keras combo for deep learning.

Source available at
[GitHub](https://github.com/maciejzj/copper-grains-classification).

### Project Based Learning – ATV with semi-active suspension system

Mid 2019

The project I undertook in form of individual course of studies for one
semester. The scope of the project was to mathematically model an ATV vehicle,
identify model parameters and synthesise an adaptive digital filter for
suspension control.

The project summary and results are covered in the PM News
[magazine](https://delibra.bg.polsl.pl/dlibra/publication/55742)
(ISNN 2544-3771).

### High altitude balloon embedded software

Early 2019

Embedded Linux software for interfacing with temperature sensor and AHRS system.
Includes data sharing system in form of local web sockets.

Used technologies:

* Modern C++ with build based on Makefiles.
* Raspberry Pi hardware.
* ZMQ web socket library (more advanced MQTT competitor).
* Spdlog logger with ftm format system.
* Selected Boost libraries and C++ multithreading.

Source available at GitHub:
[frames publisher](https://github.com/maciejzj/strato-frames-publisher),
[AHRS reader](https://github.com/maciejzj/stratosphere-ahrs),
[temperature reader](https://github.com/maciejzj/stratosphere-cpu-temp).

### Maze Bot

January 2019

My semester project for embedded systems subject.
Consist of building an obstacle avoiding robot with emphasis on control theory
algorithms for enhanced maneuver precision.
Features custom electronic, electric and mechanical design.

Used technologies:

* Atmega microcontroller.
* Arduino Bootloader.
* Custom PCB design with Autodesk Eagle.
* Custom chassis design with Autodesk Fusion 360.
* Embedded control system for DC motors velocity synchronisation and nested
  feedback loop making the robot act like a custom servomechanism.
* Modelling and identification of DC motors.

Source available [GitHub](https://github.com/maciejzj/maze-bot).

---

## Other

Many more small software pieces are available at my GitHub:

* [ssb](https://github.com/maciejzj/ssb)
  simple static blogging anti-framework.
* [suckless-builds](https://github.com/maciejzj/suckless-builds)
  automated and containerised builds for suckless software-based Linux userland.
* [gps-simulaor](https://github.com/maciejzj/gps-simulator)
  GPS device simulator by parsing CVS into NMEA messages on a serial port.
* [sat-website](https://github.com/maciejzj/sat-website) landing page for the
  SAT students group.
* [cmake-project](https://github.com/maciejzj/cmake-project)
  template repo for C++ project with CMake and many CI/CD tools.
