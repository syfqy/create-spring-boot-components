# Create-spring-boot-components

## Description
A bash script to automate the creation of the Controller, Service, Repository and model components of a Spring Boot application. 

## Installation

1. Clone the project to your Downloads folder

```
https://github.com/syfqy/create-spring-boot-components.git ~/Downloads
```

2. Update bash to latest version
``` 
brew install bash
which bash # /opt/homebrew/bin/bash
chsh -s /opt/homebrew/bin/bash
```

3. Restart terminal and check bash version
```
$ bash --version
GNU bash, version 5.1.8(1)-release (aarch64-apple-darwin20.4.0)
Copyright (C) 2020 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>

This is free software; you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.
```

4. Grant permission for script to be executable
```
chmod +x ~/Downloads/create-spring-boot-components/create-components.sh
```

### How to use

1. Navigate to current spring boot project's root directory

2. Run script via `./create-components.sh <name>`. Provide an argument `name` that will be the prefix of the class names.
```
$ ~/Downloads/create-spring-boot-components/./create-components.sh order
creating the following files:
>>> models/Order.java
>>> controllers/OrderController.java
>>> services/OrderService.java
>>> repositories/OrderRepository.java
```