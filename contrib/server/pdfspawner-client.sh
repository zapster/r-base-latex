#!/bin/bash

set -u
curl $PDF_SPAWNER_HOST:$PDF_SPAWNER_PORT/$1
