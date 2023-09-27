#!/bin/bash

# Define the API base URL
API_BASE_URL="https://pokeapi.co/api/v2"

# Function to make a GET request and optionally save the formatted JSON result to a file
function make_get_request() {
    local endpoint="$1"
    local url="${API_BASE_URL}/${endpoint}"
    local output_file="$2"
    
    echo "Making GET request to: ${url}"
    
    # Use curl to make the GET request and pipe through jq for formatting (if output_file is provided)
    if [ -z "$output_file" ]; then
        curl -s "${url}" | jq '.'
    else
        curl -s "${url}" | jq '.' > "files/${output_file}"
        echo "Response saved to: ${output_file}"
    fi
}

# Function to make a POST request and optionally save the formatted JSON result to a file
function make_post_request() {
    local endpoint="$1"
    local url="${API_BASE_URL}/${endpoint}"
    local data="$2"  # JSON data to send in the request body
    local output_file="$3"
    
    echo "Making POST request to: ${url}"
    
    # Use curl to make the POST request with JSON data and pipe through jq for formatting (if output_file is provided)
    if [ -z "$output_file" ]; then
        curl -s -X POST -H "Content-Type: application/json" -d "${data}" "${url}" | jq '.'
    else
        curl -s -X POST -H "Content-Type: application/json" -d "${data}" "${url}" | jq '.' > "${output_file}"
        echo "Response saved to: ${output_file}"
    fi
}

# Example usage:
# Make a GET request to the "users" endpoint, format the JSON, and output to the console
make_get_request "pokemon"

# Example usage:
# Make a GET request to the "users" endpoint, format the JSON, and save the result to a file
make_get_request "pokemon" "get_users_response.json"

# Example usage:
# Make a POST request to the "create_user" endpoint with JSON data, format the JSON, and output to the console
user_data='{"name": "John Doe", "email": "johndoe@example.com"}'
make_post_request "create_user" "${user_data}"

# Example usage:
# Make a POST request to the "create_user" endpoint with JSON data, format the JSON, and save the result to a file
make_post_request "create_user" "${user_data}" "create_user_response.json"
