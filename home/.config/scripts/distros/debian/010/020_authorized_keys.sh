#!/bin/bash

# Pull latest keys from GH
curl https://github.com/shawngmc.keys | tee -a ~/.ssh/authorized_keys
