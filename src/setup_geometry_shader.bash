#!/bin/bash

# Constants
build_shader_dir=build/shaders
shader_path="src/shaders"
geometry_shaders=$(ls "$shader_path" | grep .geom)

mkdir -p "$build_shader_dir"

for shader in $geometry_shaders
do
  touch "$build_shader_dir/$shader"
  echo "#version 330 core" > "$build_shader_dir/$shader"
  echo "" >> "$build_shader_dir/$shader"

  for statement in $@
  do
    echo '#define' $(echo $statement | tr '=' ' ') >> "$build_shader_dir/$shader"
  done

  cat "$shader_path/$shader" >> "$build_shader_dir/$shader"
done
