for file in *.zip; do
  unzip "$file" -d "${file%.zip}"
done
