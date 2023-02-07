# Introduction

This project is for exploring the techniques for modularity by implementing domain driven design and using packwerk to enforce dependencies and avoid privacy violations

## Resources to discover first

1. [What is Domain driven design (DDD) ?](https://www.geeksforgeeks.org/domain-driven-design-ddd/)
2. [What is packwerk ?](https://github.com/Shopify/packwerk)
3. What is Repository in DDD ?

## Check compnents/ folder

1. *app_base* is a component for every common base for all other components i.e policies, services, active record, ...
2. *blorgh* is a sample component defining the addition functionality of blogging to the main application using Rails engine, packwerk and patterns like repository and adapter

## How to install

1. To automate the steps by puting your .env file in the root directory, replacing APP_ID and creating the docker network,
Run this script command inside your project's root directory.

    ```
      ./script.sh
    ```

2. After creating the network, your docker containers should run fine
    ```
      docker compose up
    ```
