/*

Cleaning Data in SQL QueriesCACHE

*/

Select *
From nashvillehousings;

--------------------------------------------------------------------------------------------------------------------------
/*
-- Standardize Date Format

Select saleDate, TO_CHAR(SaleDate, 'YYYY-MM-DD') as saleDateConverted
From nashvillehousings


Update nashvillehousings
SET SaleDate = saleDateConverted
 --------------------------------------------------------------------------------------------------------------------------
*/

 --------------------------------------------------------------------------------------------------------------------------

-- Populate Property Address data

Select *
From nashvillehousings
WHERE PropertyAddress is null
order by ParcelID;

Select a.ParcelID, a.PropertyAddress, b.ParcelID, b.PropertyAddress, COALESCE(a.PropertyAddress, b.PropertyAddress) AS PropertyAddress
From nashvillehousings AS a
JOIN nashvillehousings AS b 
	ON a.ParcelID = b.ParcelID
	AND a.UniqueID <> b.UniqueID
Where a.PropertyAddress is null 

UPDATE nashvillehousings AS a
SET PropertyAddress = COALESCE(a.PropertyAddress, b.PropertyAddress)
FROM nashvillehousings AS b
WHERE a.ParcelID = b.ParcelID
    AND a.UniqueID <> b.UniqueID
    AND a.PropertyAddress IS NULL;


Select *
From nashvillehousings
--------------------------------------------------------------------------------------------------------------------------

-- Breaking out Address into Individual Columns (Address, City, State)

Select PropertyAddress
From nashvillehousings
--Where PropertyAddress is null
--order by ParcelID

-- Breaking out Address depending on the position of the comma ','
SELECT
    SUBSTRING(PropertyAddress, 1, POSITION(',' IN PropertyAddress) - 1) AS Address,
    SUBSTRING(PropertyAddress, POSITION(',' IN PropertyAddress) + 1, LENGTH(PropertyAddress)) AS Address
FROM nashvillehousings;

-- Create a new column PropertySplitAddress for the first Adress part (before comma)
ALTER TABLE nashvillehousings
Add PropertySplitAddress VARCHAR(42);

-- Add values to PropertySplitAddress
Update nashvillehousings
SET PropertySplitAddress = SUBSTRING(PropertyAddress, 1, POSITION(',' IN PropertyAddress) - 1)

-- Create a new column PropertySplitCity for the second Adress part (after comma)
ALTER TABLE nashvillehousings
Add PropertySplitCity VARCHAR(42);

-- Add values to PropertySplitCity
Update nashvillehousings
SET PropertySplitCity = SUBSTRING(PropertyAddress, POSITION(',' IN PropertyAddress) + 1, LENGTH(PropertyAddress))

-- When we select all we can see 2 new columns 
Select *
From nashvillehousings

--------------------------------------------------------------------------------------------------------------------------
Select OwnerAddress
From nashvillehousings

-- Breaking out Owner Address to 3 parts (separetad by comma)
SELECT 
    SPLIT_PART(REPLACE(OwnerAddress, ',', '.'), '.', 3) AS Part3,
    SPLIT_PART(REPLACE(OwnerAddress, ',', '.'), '.', 2) AS Part2,
    SPLIT_PART(REPLACE(OwnerAddress, ',', '.'), '.', 1) AS Part1
FROM nashvillehousings;

-- Alter the table to add 3 colmns, 1 for each part 
ALTER TABLE nashvillehousings
Add OwnerSplitAddress VARCHAR(42);

Update nashvillehousings
SET OwnerSplitAddress = SPLIT_PART(REPLACE(OwnerAddress, ',', '.'), '.', 3)

ALTER TABLE nashvillehousings
Add OwnerSplitCity VARCHAR(42);

Update nashvillehousings
SET OwnerSplitCity = SPLIT_PART(REPLACE(OwnerAddress, ',', '.'), '.', 2)

ALTER TABLE nashvillehousings
Add OwnerSplitState VARCHAR(42);

Update nashvillehousings
SET OwnerSplitState = SPLIT_PART(REPLACE(OwnerAddress, ',', '.'), '.', 1)

Select *
From nashvillehousings;

--------------------------------------------------------------------------------------------------------------------------

-- Change Y and N to Yes and No in "Sold as Vacant" field

Select Distinct(SoldAsVacant), Count(SoldAsVacant)
From nashvillehousings
Group by SoldAsVacant
Order by 2

-- We notice that in this column we have 52 Y, 399 N, 4623 Yes and 51403 No
-- Let's change everything to Yes and No instead of Y and N

Select SoldAsVacant, 
CASE When SoldAsVacant = 'Y' THEN 'Yes'
	 When SoldAsVacant = 'N' THEN 'No'
	 ELSE SoldAsVacant
	 END
From nashvillehousings


Update nashvillehousings
SET SoldAsVacant = CASE When SoldAsVacant = 'Y' THEN 'Yes'
	   When SoldAsVacant = 'N' THEN 'No'
	   ELSE SoldAsVacant
	   END
	   
Select *
From nashvillehousings;

-----------------------------------------------------------------------------------------------------------------------------------------------------------

-- Remove Duplicates
-- Identify duplicates by using row_number()

WITH RowNumCTE AS(
Select *,
	ROW_NUMBER() OVER (
	PARTITION BY ParcelID,
				 PropertyAddress,
				 SalePrice,
				 SaleDate,
				 LegalReference
				 ORDER BY
					UniqueID
					) row_num
From nashvillehousings
--order by ParcelID
)
SELECT *
From RowNumCTE
Where row_num > 1  -- Select all repeating rows 
Order by PropertyAddress

WITH RowNumCTE AS (
  SELECT *,
    ROW_NUMBER() OVER (
      PARTITION BY ParcelID,
                   PropertyAddress,
                   SalePrice,
                   SaleDate,
                   LegalReference
      ORDER BY UniqueID
    ) AS row_num
  FROM nashvillehousings
  -- ORDER BY ParcelID
)
-- SELECT *
DELETE FROM nashvillehousings
WHERE (ParcelID, PropertyAddress, SalePrice, SaleDate, LegalReference) IN (
  SELECT ParcelID, PropertyAddress, SalePrice, SaleDate, LegalReference
  FROM RowNumCTE
  WHERE row_num > 1
);


Select *
From WITH RowNumCTE AS (
  SELECT *,
    ROW_NUMBER() OVER (
      PARTITION BY ParcelID,
                   PropertyAddress,
                   SalePrice,
                   SaleDate,
                   LegalReference
      ORDER BY UniqueID
    ) AS row_num
  FROM nashvillehousings
  -- ORDER BY ParcelID
)
-- SELECT *
DELETE FROM nashvillehousings
WHERE (ParcelID, PropertyAddress, SalePrice, SaleDate, LegalReference) IN (
  SELECT ParcelID, PropertyAddress, SalePrice, SaleDate, LegalReference
  FROM RowNumCTE
  WHERE row_num > 1
);


---------------------------------------------------------------------------------------------------------

-- Delete Unused Columns


Select *
From nashvillehousings


ALTER TABLE nashvillehousings
DROP COLUMN OwnerAddress,
DROP COLUMN taxdistrict,
DROP COLUMN PropertyAddress,
DROP COLUMN SaleDate;

