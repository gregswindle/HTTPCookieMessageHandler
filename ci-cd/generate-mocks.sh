# Reference for the Cuckoo script required during the HTTPCookieMessageHandlerTests
# Build Phase as a Run Script called "Generate Mocks".

# Define output file. Change "$PROJECT_DIR/Tests" to your test's root source folder, if it's not the default name.
OUTPUT_FILE="$PROJECT_DIR/HTTPCookieMessageHandlerTests/Mocks/GeneratedMocks.swift"
echo "Generated Mocks File = $OUTPUT_FILE"

# Define input directory. Change "$PROJECT_DIR" to your project's root source folder, if it's not the default name.
INPUT_DIR="$PROJECT_DIR/HTTPCookieMessageHandler"
echo "Mocks Input Directory = $INPUT_DIR"

# Generate mock files, include as many input files as you'd like to create mocks for.
${PODS_ROOT}/Cuckoo/run generate --testable "$PROJECT_NAME" \
--output "${OUTPUT_FILE}" \
"$INPUT_DIR/HTTPCookieJson.swift" \
"$INPUT_DIR/HTTPCookieMessageHandler.swift" \
"$INPUT_DIR/MessageHandler.swift"
