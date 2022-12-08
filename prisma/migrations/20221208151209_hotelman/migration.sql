-- CreateTable
CREATE TABLE "Hotel" (
    "hotelID" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "location" TEXT NOT NULL,

    CONSTRAINT "Hotel_pkey" PRIMARY KEY ("hotelID")
);

-- CreateTable
CREATE TABLE "Employee" (
    "employeeId" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "gender" TEXT NOT NULL,
    "address" TEXT NOT NULL,
    "worksAt" INTEGER NOT NULL,

    CONSTRAINT "Employee_pkey" PRIMARY KEY ("employeeId")
);

-- CreateTable
CREATE TABLE "Room" (
    "roomNo" INTEGER NOT NULL,
    "price" INTEGER NOT NULL,
    "type" TEXT NOT NULL,
    "locatedAt" INTEGER NOT NULL,
    "booked" BOOLEAN NOT NULL,

    CONSTRAINT "Room_pkey" PRIMARY KEY ("roomNo")
);

-- CreateTable
CREATE TABLE "User" (
    "userID" SERIAL NOT NULL,
    "manager" BOOLEAN NOT NULL,
    "hotelID" INTEGER,
    "name" TEXT NOT NULL,
    "phoneNo" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("userID")
);

-- CreateTable
CREATE TABLE "Bill" (
    "transactionId" SERIAL NOT NULL,
    "roomNo" INTEGER NOT NULL,
    "customerId" INTEGER NOT NULL,
    "finalPrice" INTEGER NOT NULL,
    "bookingDate" TIMESTAMP(3) NOT NULL,
    "bookedDate" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Bill_pkey" PRIMARY KEY ("transactionId")
);

-- AddForeignKey
ALTER TABLE "Employee" ADD CONSTRAINT "Employee_worksAt_fkey" FOREIGN KEY ("worksAt") REFERENCES "Hotel"("hotelID") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Room" ADD CONSTRAINT "Room_locatedAt_fkey" FOREIGN KEY ("locatedAt") REFERENCES "Hotel"("hotelID") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_hotelID_fkey" FOREIGN KEY ("hotelID") REFERENCES "Hotel"("hotelID") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Bill" ADD CONSTRAINT "Bill_roomNo_fkey" FOREIGN KEY ("roomNo") REFERENCES "Room"("roomNo") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Bill" ADD CONSTRAINT "Bill_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES "User"("userID") ON DELETE RESTRICT ON UPDATE CASCADE;
