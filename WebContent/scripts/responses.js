function getBotResponse(input) {
    //rock paper scissors
    if (input == "yes") {
        return "Type C for customer support, P for product support and J to know about jumpstart";
    } else if (input == "no") {
        return "Ok!";
    } else if (input == "C") {
        return "You can contact us through email and phone(+91 8923456)";
    }
    else if (input == "P") {
        return "Which product do you want type M for mobiles, L for laptops and O for other products";
    }
    else if (input == "M") {
        return "Yes! we have all types of mobile just sign-up and you will get your product";
    } 
    else if (input == "L") {
        return "Yes! we have all types of Laptops just sign-up and you will get your product";
    }
    else if (input == "O") {
        return "You can check the product by sign-up and sign-up!";
    }
    else if (input == "J") {
        return "Jumpstart is a electronic retail store we sell electronic products like mobiles and laptops. We have cuurently digitalize our retail store if you need any electronic product you can buy from our website.";
    } else {
        return "Sorry! we cannot understand plz contact us!";
    }
   

}