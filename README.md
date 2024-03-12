# Byte Store  

An electronic online shop. This app uses the backend from the website [Laravel Byte Store](https://github.com/munovrizall/bytestore_laravel_jagoflutter).

## Table of Contents

- [Introduction](#introduction)
- [Features](#features)
- [Setup](#setup)
- [Acknowledgments](#acknowledgments)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Introduction

This project was developed during my participation in the Flutter Intensive Club Batch 12 by [Jagoflutter](https://jagoflutter.com/). Byte Store is an online shop mobile application equipped with capabilities commonly found in e-commerce platforms. It includes features such as order products, making payments through virtual accounts, and tracking package delivery progress.

![Built with Flutter](https://img.shields.io/badge/Built_with-Flutter-blue.svg)

## Features

A few of the things you can do with this apps:

- Order multiple products using the cart.
- Make payments via a virtual account.
- Add user addresses.
- Check delivery prices.
- Track ongoing orders.
- Implement Firebase push notifications.
- Log in to the account using Laravel Fortify authentication.


<p align="center">
  <img src = "https://i.imgur.com/8kqA1Eu.png" width=1080>
</p>

## Setup

1. Clone this project.

```
git clone https://github.com/munovrizall/bytestore_flutter_jagoflutter.git
```

2. Open byte_store\lib\core\constants\variables.dart and edit 'baseUrl' to use your ip address.

3. Start Laragon or XAMPP.

4. Clone the backend website, and follow the setup steps, until the website is served.

```
git clone https://github.com/munovrizall/bytestore_laravel_jagoflutter.git
```

5. Run this app.

```
flutter run
```

6. You are ready to go!

## Acknowledgments

Thanks to [Jagoflutter](https://jagoflutter.com/) for the guidance and the knowledge.
