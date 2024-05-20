# CapCoin API Documentation

This document provides an overview of the `HttpService` class used in the CapCoin project to interface with the CoinGecko API. The `HttpService` class is responsible for configuring the Dio HTTP client and making GET requests to the API.

## Table of Contents

- [Overview](#overview)
- [Configuration](#configuration)
- [Dependencies](#dependencies)

## Overview

The `HttpService` class sets up the Dio HTTP client with necessary headers and base URL, which are configured using the `AppConfig` class. This service is used to fetch data from the CoinGecko API.

## Configuration

The `HttpService` class relies on the `AppConfig` class for configuration details such as the base URL and API key. These configurations are retrieved using the Get It service locator.

### Dependencies

Ensure the following dependencies are included in your `pubspec.yaml` file:

```yaml
dependencies:
  dio: ^4.0.0
  get_it: ^7.2.0
