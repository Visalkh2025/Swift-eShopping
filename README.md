# Swift-eShopping

A modern iOS application built with SwiftUI and the MVVM architecture, displaying product data from the Fake Store API. This project is designed as a clean example of networked app structure, with search, category filtering, and detailed product displays.

## Table of Contents
- [Overview](#overview)
- [Features](#features)
- [Architecture](#architecture)
- [Core Files](#core-files)
- [Setup & Running](#setup--running)
- [API](#api)
- [Screenshots](#screenshots)
- [License](#license)

## Overview

This app connects to the [Fake Store API](https://fakestoreapi.com) to present a browsable catalog of products. Users can filter by category, search by name, and view details for each item. It's structured for learning or as a starter template for more complex MVVM apps.

## Features

- Product list fetched from the Fake Store API
- Search bar for real-time filtering
- Horizontal category filter chips
- Product statistics (count, average price)
- Pull-to-refresh on product list
- Loading and error states
- Product detail view with full information

## Architecture

The app follows the Model-View-ViewModel (MVVM) pattern:
- **Model:** Data structures for products and ratings, conforming to `Codable` for easy parsing
- **ViewModel:** Business logic, API calls, and state management (search, filter, loading, errors)
- **View:** SwiftUI views for UI presentation and user interaction

Networking uses Swift's `async/await` for clean, modern concurrency.

## Core Files

- `ProductListView.swift`: Main screen showing header, search, category chips, product list
- `ProductsViewModels.swift`: Handles product fetching, filtering, search logic
- `Products.swift`: The main product model (id, title, price, description, etc.)
- `NetworkManager.swift`: Handles networking, decoding JSON from the API
- `DoublePrice.swift`: Extension for currency formatting
- Reusable UI: category chip, product row, product detail view

## Setup & Running

1. **Clone this repository:**
    ```sh
    git clone <your_repo_url>
