-- CreateTable
CREATE TABLE "Customer" (
    "customerID" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "phoneNo" TEXT NOT NULL,
    "address" TEXT NOT NULL,
    "DOB" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Customer_pkey" PRIMARY KEY ("customerID")
);

-- CreateTable
CREATE TABLE "Booking" (
    "bookingID" SERIAL NOT NULL,
    "checkinDate" TIMESTAMP(3) NOT NULL,
    "checkoutDate" TIMESTAMP(3) NOT NULL,
    "billNo" INTEGER NOT NULL,
    "userNo" INTEGER NOT NULL,
    "roomNo" INTEGER NOT NULL,

    CONSTRAINT "Booking_pkey" PRIMARY KEY ("bookingID")
);

-- CreateTable
CREATE TABLE "Bill" (
    "billID" SERIAL NOT NULL,
    "amount" INTEGER NOT NULL,
    "paymentDate" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Bill_pkey" PRIMARY KEY ("billID")
);

-- CreateTable
CREATE TABLE "Hotel" (
    "hotelID" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "address" TEXT NOT NULL,
    "password" TEXT NOT NULL,

    CONSTRAINT "Hotel_pkey" PRIMARY KEY ("hotelID")
);

-- CreateTable
CREATE TABLE "Room" (
    "roomNo" SERIAL NOT NULL,
    "description" TEXT NOT NULL,
    "price" INTEGER NOT NULL,
    "type" TEXT NOT NULL,
    "booked" BOOLEAN NOT NULL,
    "hotelNo" INTEGER NOT NULL,

    CONSTRAINT "Room_pkey" PRIMARY KEY ("roomNo")
);

-- CreateTable
CREATE TABLE "Review" (
    "reviewID" SERIAL NOT NULL,
    "review" INTEGER NOT NULL,
    "description" TEXT NOT NULL,
    "userNo" INTEGER NOT NULL,
    "roomNo" INTEGER NOT NULL,

    CONSTRAINT "Review_pkey" PRIMARY KEY ("reviewID")
);

-- AddForeignKey
ALTER TABLE "Booking" ADD CONSTRAINT "Booking_roomNo_fkey" FOREIGN KEY ("roomNo") REFERENCES "Room"("roomNo") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Booking" ADD CONSTRAINT "Booking_billNo_fkey" FOREIGN KEY ("billNo") REFERENCES "Bill"("billID") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Booking" ADD CONSTRAINT "Booking_userNo_fkey" FOREIGN KEY ("userNo") REFERENCES "Customer"("customerID") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Room" ADD CONSTRAINT "Room_hotelNo_fkey" FOREIGN KEY ("hotelNo") REFERENCES "Hotel"("hotelID") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Review" ADD CONSTRAINT "Review_userNo_fkey" FOREIGN KEY ("userNo") REFERENCES "Customer"("customerID") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Review" ADD CONSTRAINT "Review_roomNo_fkey" FOREIGN KEY ("roomNo") REFERENCES "Room"("roomNo") ON DELETE RESTRICT ON UPDATE CASCADE;
