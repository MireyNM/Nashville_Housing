-- Create Nashville Housing Table 
CREATE TABLE nashvillehousings(
   UniqueID        INTEGER  NOT NULL PRIMARY KEY,
   ParcelID        VARCHAR(16) NOT NULL,
   LandUse         VARCHAR(42) NOT NULL,
   PropertyAddress VARCHAR(42),
   SaleDate        DATE  NOT NULL,
   SalePrice       VARCHAR(11) NOT NULL,
   LegalReference  VARCHAR(17) NOT NULL,
   SoldAsVacant    VARCHAR(3) NOT NULL,
   OwnerName       VARCHAR(60),
   OwnerAddress    VARCHAR(46),
   Acreage         NUMERIC(6,2),
   TaxDistrict     VARCHAR(25),
   LandValue       INTEGER, 
   BuildingValue   INTEGER, 
   TotalValue      INTEGER, 
   YearBuilt       INTEGER, 
   Bedrooms        INTEGER, 
   FullBath        INTEGER, 
   HalfBath        INTEGER 
);

-- Visualisze Table
SELECT * FROM nashvillehousings;