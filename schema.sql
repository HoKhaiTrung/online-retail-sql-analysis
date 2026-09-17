-- Represent customers in the online retail business

CREATE TABLE "Customer" (
    "CustomerID" INTEGER,
    "Country" TEXT,
    PRIMARY KEY("CustomerID")
);

-- Represent products sold by the retailer

CREATE TABLE "Product" (
    "StockCode" TEXT,
    "Description" TEXT,
    PRIMARY KEY("StockCode")
);

-- Represent invoices issued by the retailer

CREATE TABLE "Invoice" (
    "InvoiceNo" TEXT,
    "InvoiceDate" TEXT,
    "CustomerID" INTEGER,
    PRIMARY KEY("InvoiceNo"),
    FOREIGN KEY("CustomerID") REFERENCES "Customer"("CustomerID")
);

-- Represent individual product or business line items in invoices

CREATE TABLE "InvoiceLine" (
    "InvoiceLineID" TEXT,
    "InvoiceNo" TEXT,
    "StockCode" TEXT,
    "Quantity" INTEGER NOT NULL,
    "UnitPrice" DECIMAL NOT NULL,
    PRIMARY KEY("InvoiceLineID"),
    FOREIGN KEY("InvoiceNo") REFERENCES "Invoice"("InvoiceNo"),
    FOREIGN KEY("StockCode") REFERENCES "Product"("StockCode")
);

-- Create an index to speed searches by product

CREATE INDEX "StockCode_search"
ON "InvoiceLine" ("StockCode");
