#!/bin/bash

# Function to display services
display_services() {
    echo "Services:"
    echo "1) Cut"
    echo "2) Color"
    echo "3) Style"
}

# Display services before the first prompt
display_services

# Read service_id input
read -p "Enter service_id: " SERVICE_ID_SELECTED

# Loop until a valid service_id is entered
while [[ ! "$SERVICE_ID_SELECTED" =~ ^[1-3]$ ]]; do
    echo "Invalid service_id. Please select a valid service_id."
    display_services
    read -p "Enter service_id: " SERVICE_ID_SELECTED
done

# Read customer phone input
read -p "Enter customer phone: " CUSTOMER_PHONE

# Check if the customer already exists
if ! grep -q "$CUSTOMER_PHONE" customers.txt; then
    # If not, prompt for customer name
    read -p "Enter customer name: " CUSTOMER_NAME

    # Add new customer to the customers table
    echo "$CUSTOMER_PHONE,$CUSTOMER_NAME" >> customers.txt
fi

# Read service time input
read -p "Enter service time: " SERVICE_TIME

# Add appointment to the appointments table
echo "$SERVICE_ID_SELECTED,$CUSTOMER_PHONE,$SERVICE_TIME" >> appointments.txt

# Display confirmation message
echo "I have put you down for a service at $SERVICE_TIME, $CUSTOMER_NAME."
