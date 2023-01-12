# Create-spring-boot-app

## Description
A bash script to automate the creation of the Controller, Service, Repository and model components of a Spring Boot application. 

## How to use

Only need to do step 1 to 5 once. Subsequently just run step 6.

1. Update bash to latest version
``` 
brew install bash
which bash # /opt/homebrew/bin/bash
chsh -s /opt/homebrew/bin/bash
```

2. Restart terminal and check bash version
```
$ bash --version
GNU bash, version 5.1.8(1)-release (aarch64-apple-darwin20.4.0)
Copyright (C) 2020 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>

This is free software; you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.
```

3. Navigate to directory containing the script

4. Grant permission for script to be executable
```
chmod +x create-spring-boot-app.sh
```

5. Navigate to current spring boot project's root directory

6. Run script via `./create-spring-boot-app.sh <name>`. Provide an argument `name` that will be the name of the classes.
```
$ ~/Downloads/./create-spring-boot-app.sh order
creating the following files:
>>> models/Order.java
>>> controllers/OrderController.java
>>> services/OrderService.java
>>> repositories/OrderRepository.java
```