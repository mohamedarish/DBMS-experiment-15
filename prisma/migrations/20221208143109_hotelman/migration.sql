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
    "locatedAt" INTEGER NOT NULL,
    "booked" BOOLEAN NOT NULL,

    CONSTRAINT "Room_pkey" PRIMARY KEY ("roomNo")
);

-- CreateTable
CREATE TABLE "User" (
    "userID" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "phoneNo" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("userID")
);

-- AddForeignKey
ALTER TABLE "Employee" ADD CONSTRAINT "Employee_worksAt_fkey" FOREIGN KEY ("worksAt") REFERENCES "Hotel"("hotelID") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Room" ADD CONSTRAINT "Room_locatedAt_fkey" FOREIGN KEY ("locatedAt") REFERENCES "Hotel"("hotelID") ON DELETE RESTRICT ON UPDATE CASCADE;
