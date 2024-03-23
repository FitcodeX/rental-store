window.onload = () => {
    const baseUrl ="http://3.129.15.112:8000" 

    const doFetch = async (url) => {
        const result = await fetch(url)
        const resultJson = await result.json()
        return resultJson
      }

    const getCustomerCount = async () => {
        const url = `${baseUrl}/customers`
        const fetchResult = await doFetch(url)
        const customers = fetchResult.customers
        console.log(customers.length)
        
        // Generate options for the user dropdown dynamically
        for (let i = 1; i <= customers.length; i++) {
            const option = document.createElement('option');
            option.value = i;
            option.text = i;
            userSelect.appendChild(option);
        }
      }

    getCustomerCount()
  
    const invBtn = document.querySelector("#invBtn")
    const custBtn = document.querySelector("#custBtn")
    const userSelect = document.querySelector("#userSelect")
    const userContainer = document.querySelector("#userContainer")
  
    const getRentals = async () => {
      const url = `${baseUrl}/inventory`
      const fetchResult = await doFetch(url)
      const rentals = fetchResult.rentals
      rentals.forEach( r => createHtmlRental(r))
    }

    const getCustomers = async () => {
        const url = `${baseUrl}/customers`
        const fetchResult = await doFetch(url)
        const customers = fetchResult.customers
        console.log(customers.length)
        customers.forEach( c => createHtmlCustomer(c))
      }
  
    const getCustomerRentalInfo = async (id) => {
      const url = `${baseUrl}/customers/${id}` 
      const fetchResult = await doFetch(url)
      const rentals = fetchResult.rentals
      createHtmlCustomerRental(rentals)
    }
  
    const removeInfo = () => {
      while(userContainer.firstChild) {
        userContainer.removeChild(userContainer.firstChild)
      }
    }
  
    const createHtmlRental = (rental) => {
      const div = document.createElement("div")
      const h3 = document.createElement("h3")
      const p1 = document.createElement("p")
      const p2 = document.createElement("p")
  
      h3.innerText = `ID: ${rental[0]}`
      p1.innerText = `Title: ${rental[1]}`
      p2.innerText = `Copies Available: ${rental[2]}`
  
      div.appendChild(h3)
      div.appendChild(p1)
      div.appendChild(p2)
  
      div.className = "item"
  
      userContainer.appendChild(div)
    }

    const createHtmlCustomerRental = (rental) => {
        const div = document.createElement("div")
        const h3 = document.createElement("h3")
    
        h3.innerText = `Title: ${rental}`
    
        div.appendChild(h3)
    
        div.className = "item"
    
        userContainer.appendChild(div)
      }

    const createHtmlCustomer = (customer) => {
        const div = document.createElement("div")
        const h3 = document.createElement("h3")
        const p1 = document.createElement("p")
        const p2 = document.createElement("p")
    
        h3.innerText = `ID: ${customer[0]}`
        p1.innerText = `Name: ${customer[1]} ${customer[2]}`
        p2.innerText = `Account Type: ${customer[3]}`
    
        div.appendChild(h3)
        div.appendChild(p1)
        div.appendChild(p2)
    
        div.className = "item"
    
        userContainer.appendChild(div)
      }
  
  
    userSelect.addEventListener("change" ,(e) => {
        removeInfo()
        getCustomerRentalInfo(e.target.value)
      })
    
    invBtn.addEventListener("click" ,() => {
        removeInfo()
        getRentals()
      })

    custBtn.addEventListener("click" ,() => {
        removeInfo()
        getCustomers()
      })

    // Selecting elements from the DOM
const addCustomerBtn = document.querySelector("#addCustomerBtn");
const addCustomerForm = document.querySelector("#addCustomerForm");
const newCustomerForm = document.querySelector("#newCustomerForm");

// Function to show the add customer form
const showAddCustomerForm = () => {
    addCustomerForm.style.display = 'block'; // Make the form visible
};

// Attach click event listener to the "Add New Customer" button
addCustomerBtn.addEventListener("click", showAddCustomerForm);

// Async function to handle the submission of the new customer form
const submitNewCustomer = async (event) => {
    event.preventDefault(); // Prevent the form from submitting in the traditional way

    // Collect input values from the form
    const firstName = newCustomerForm.querySelector("#firstName").value;
    const lastName = newCustomerForm.querySelector("#lastName").value;
    const accountType = newCustomerForm.querySelector("#accountType").value;

    // Prepare data to be sent to the server
    const customerData = { firstName:firstName, lastName:lastName, accountType:accountType };

    // Log the customerData to the console for inspection
    console.log(customerData);

    // Send the data to the server using fetch
    try {
        const response = await fetch(`${baseUrl}/addCustomer`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(customerData),
        });

        if (response.ok) {
            const result = await response.json();
            console.log('Success:', result);
            // Handle success (e.g., displaying a success message or clearing the form)
            addCustomerForm.style.display = 'none'; // Optionally hide the form again
            newCustomerForm.reset(); // Reset the form fields
        } else {
            // Handle server errors or invalid responses
            console.error('Error adding customer:', response.statusText);
        }
    } catch (error) {
        // Handle network errors
        console.error('Network error:', error);
    }
};

// Attach submit event listener to the new customer form
newCustomerForm.addEventListener("submit", submitNewCustomer);
   

  }

  






