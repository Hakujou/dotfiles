#!/bin/bash

rsync --exclude '.git' --exclude `basename $0` -ravI . ~/
