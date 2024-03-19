INPUT_DIRS=(
  "/g/data/xe2/datasets/uploads_public/ctrap_ont_pod5/20231017_1728_1F_PAQ09278_af45b1bf/pod5_pass"
  "/g/data/xe2/datasets/uploads_public/ctrap_ont_pod5/20231023_1117_1F_PAQ09278_674d2cfd/pod5_pass"
)

file_list=()

# Iterate over each path
for path in "${INPUT_DIRS[@]}"; do
  # Use find to locate all .pod5 files under the current path and add them to the file_list array
  file_list+=($(find "$path" -type f -name "*.pod5"))
done

# Print the file paths
echo "List of .pod5 files:"
printf "%s\n" "${file_list[@]}"
