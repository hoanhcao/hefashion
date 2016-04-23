
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 01/05/2016 09:01:05
-- Generated from EDMX file: D:\Projects\MyStore.App\MyStore.App\Models\MyStoreModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [MyStore];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[fk_Order_OrderStatus]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Orders] DROP CONSTRAINT [fk_Order_OrderStatus];
GO
IF OBJECT_ID(N'[dbo].[fk_OrderItem_OrderId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Order_Items] DROP CONSTRAINT [fk_OrderItem_OrderId];
GO
IF OBJECT_ID(N'[dbo].[fk_OrderItem_OrderStatusId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Order_Items] DROP CONSTRAINT [fk_OrderItem_OrderStatusId];
GO
IF OBJECT_ID(N'[dbo].[fk_OrderItem_ProductId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Order_Items] DROP CONSTRAINT [fk_OrderItem_ProductId];
GO
IF OBJECT_ID(N'[dbo].[fk_Parent_ProductId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Ref_Product_Type] DROP CONSTRAINT [fk_Parent_ProductId];
GO
IF OBJECT_ID(N'[dbo].[fk_Product_ProductType]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Products] DROP CONSTRAINT [fk_Product_ProductType];
GO
IF OBJECT_ID(N'[dbo].[fk_Product_ProductUOM]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Products] DROP CONSTRAINT [fk_Product_ProductUOM];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Order_Items]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Order_Items];
GO
IF OBJECT_ID(N'[dbo].[Order_Status_Codes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Order_Status_Codes];
GO
IF OBJECT_ID(N'[dbo].[Orders]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Orders];
GO
IF OBJECT_ID(N'[dbo].[Products]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Products];
GO
IF OBJECT_ID(N'[dbo].[Ref_Order_Item_Status_Codes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Ref_Order_Item_Status_Codes];
GO
IF OBJECT_ID(N'[dbo].[Ref_Product_Type]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Ref_Product_Type];
GO
IF OBJECT_ID(N'[dbo].[Unit_Of_Measure]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Unit_Of_Measure];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Order_Items'
CREATE TABLE [dbo].[Order_Items] (
    [order_item_id] int IDENTITY(1,1) NOT NULL,
    [product_id] int  NOT NULL,
    [order_id] int  NOT NULL,
    [order_item_status_id] int  NOT NULL,
    [order_item_quantity] float  NOT NULL,
    [order_item_description] nvarchar(max)  NULL
);
GO

-- Creating table 'Order_Status_Codes'
CREATE TABLE [dbo].[Order_Status_Codes] (
    [order_status_id] int IDENTITY(1,1) NOT NULL,
    [order_status_description] nvarchar(50)  NULL
);
GO

-- Creating table 'Orders'
CREATE TABLE [dbo].[Orders] (
    [order_id] int IDENTITY(1,1) NOT NULL,
    [user_id] int  NOT NULL,
    [order_status_id] int  NOT NULL,
    [date_order_placed] datetime  NULL,
    [order_description] nvarchar(max)  NULL
);
GO

-- Creating table 'Products'
CREATE TABLE [dbo].[Products] (
    [product_id] int  NOT NULL,
    [product_type_id] int  NOT NULL,
    [product_name] nvarchar(10)  NULL,
    [product_uom_id] int  NOT NULL,
    [product_description] nvarchar(max)  NULL,
    [product_price] decimal(18,0)  NULL,
    [product_color] nvarchar(100)  NULL,
    [product_size] nvarchar(100)  NULL,
    [other_detail] nvarchar(max)  NULL
);
GO

-- Creating table 'Ref_Order_Item_Status_Codes'
CREATE TABLE [dbo].[Ref_Order_Item_Status_Codes] (
    [order_item_status_id] int IDENTITY(1,1) NOT NULL,
    [order_item_status_description] nvarchar(50)  NULL
);
GO

-- Creating table 'Ref_Product_Type'
CREATE TABLE [dbo].[Ref_Product_Type] (
    [product_type_id] int IDENTITY(1,1) NOT NULL,
    [parent_product_type_id] int  NULL,
    [product_type_description_vn] nvarchar(1000)  NULL,
    [product_type_description_en] nvarchar(1000)  NULL
);
GO

-- Creating table 'Unit_Of_Measure'
CREATE TABLE [dbo].[Unit_Of_Measure] (
    [UOM_id] int IDENTITY(1,1) NOT NULL,
    [UOM_description] nvarchar(10)  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [order_item_id] in table 'Order_Items'
ALTER TABLE [dbo].[Order_Items]
ADD CONSTRAINT [PK_Order_Items]
    PRIMARY KEY CLUSTERED ([order_item_id] ASC);
GO

-- Creating primary key on [order_status_id] in table 'Order_Status_Codes'
ALTER TABLE [dbo].[Order_Status_Codes]
ADD CONSTRAINT [PK_Order_Status_Codes]
    PRIMARY KEY CLUSTERED ([order_status_id] ASC);
GO

-- Creating primary key on [order_id] in table 'Orders'
ALTER TABLE [dbo].[Orders]
ADD CONSTRAINT [PK_Orders]
    PRIMARY KEY CLUSTERED ([order_id] ASC);
GO

-- Creating primary key on [product_id] in table 'Products'
ALTER TABLE [dbo].[Products]
ADD CONSTRAINT [PK_Products]
    PRIMARY KEY CLUSTERED ([product_id] ASC);
GO

-- Creating primary key on [order_item_status_id] in table 'Ref_Order_Item_Status_Codes'
ALTER TABLE [dbo].[Ref_Order_Item_Status_Codes]
ADD CONSTRAINT [PK_Ref_Order_Item_Status_Codes]
    PRIMARY KEY CLUSTERED ([order_item_status_id] ASC);
GO

-- Creating primary key on [product_type_id] in table 'Ref_Product_Type'
ALTER TABLE [dbo].[Ref_Product_Type]
ADD CONSTRAINT [PK_Ref_Product_Type]
    PRIMARY KEY CLUSTERED ([product_type_id] ASC);
GO

-- Creating primary key on [UOM_id] in table 'Unit_Of_Measure'
ALTER TABLE [dbo].[Unit_Of_Measure]
ADD CONSTRAINT [PK_Unit_Of_Measure]
    PRIMARY KEY CLUSTERED ([UOM_id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [order_id] in table 'Order_Items'
ALTER TABLE [dbo].[Order_Items]
ADD CONSTRAINT [fk_OrderItem_OrderId]
    FOREIGN KEY ([order_id])
    REFERENCES [dbo].[Orders]
        ([order_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'fk_OrderItem_OrderId'
CREATE INDEX [IX_fk_OrderItem_OrderId]
ON [dbo].[Order_Items]
    ([order_id]);
GO

-- Creating foreign key on [order_item_status_id] in table 'Order_Items'
ALTER TABLE [dbo].[Order_Items]
ADD CONSTRAINT [fk_OrderItem_OrderStatusId]
    FOREIGN KEY ([order_item_status_id])
    REFERENCES [dbo].[Ref_Order_Item_Status_Codes]
        ([order_item_status_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'fk_OrderItem_OrderStatusId'
CREATE INDEX [IX_fk_OrderItem_OrderStatusId]
ON [dbo].[Order_Items]
    ([order_item_status_id]);
GO

-- Creating foreign key on [product_id] in table 'Order_Items'
ALTER TABLE [dbo].[Order_Items]
ADD CONSTRAINT [fk_OrderItem_ProductId]
    FOREIGN KEY ([product_id])
    REFERENCES [dbo].[Products]
        ([product_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'fk_OrderItem_ProductId'
CREATE INDEX [IX_fk_OrderItem_ProductId]
ON [dbo].[Order_Items]
    ([product_id]);
GO

-- Creating foreign key on [order_status_id] in table 'Orders'
ALTER TABLE [dbo].[Orders]
ADD CONSTRAINT [fk_Order_OrderStatus]
    FOREIGN KEY ([order_status_id])
    REFERENCES [dbo].[Order_Status_Codes]
        ([order_status_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'fk_Order_OrderStatus'
CREATE INDEX [IX_fk_Order_OrderStatus]
ON [dbo].[Orders]
    ([order_status_id]);
GO

-- Creating foreign key on [product_type_id] in table 'Products'
ALTER TABLE [dbo].[Products]
ADD CONSTRAINT [fk_Product_ProductType]
    FOREIGN KEY ([product_type_id])
    REFERENCES [dbo].[Ref_Product_Type]
        ([product_type_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'fk_Product_ProductType'
CREATE INDEX [IX_fk_Product_ProductType]
ON [dbo].[Products]
    ([product_type_id]);
GO

-- Creating foreign key on [product_uom_id] in table 'Products'
ALTER TABLE [dbo].[Products]
ADD CONSTRAINT [fk_Product_ProductUOM]
    FOREIGN KEY ([product_uom_id])
    REFERENCES [dbo].[Unit_Of_Measure]
        ([UOM_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'fk_Product_ProductUOM'
CREATE INDEX [IX_fk_Product_ProductUOM]
ON [dbo].[Products]
    ([product_uom_id]);
GO

-- Creating foreign key on [parent_product_type_id] in table 'Ref_Product_Type'
ALTER TABLE [dbo].[Ref_Product_Type]
ADD CONSTRAINT [fk_Parent_ProductId]
    FOREIGN KEY ([parent_product_type_id])
    REFERENCES [dbo].[Ref_Product_Type]
        ([product_type_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'fk_Parent_ProductId'
CREATE INDEX [IX_fk_Parent_ProductId]
ON [dbo].[Ref_Product_Type]
    ([parent_product_type_id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------