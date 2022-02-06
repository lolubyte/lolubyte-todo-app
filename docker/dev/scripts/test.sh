#!/bin/bash

# Activate the virtual Environment
. /appenv/bin/activate

# Install Application Test Requirements
pip install -r requirements_test.txt

# Run test.sh argumensts
exec $@