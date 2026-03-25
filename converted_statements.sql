-- ============================================================================
-- Converted SQL Statements for PostgreSQL - DocumentProcessor.Web Application
-- Conversion Method: DMS_FAILURE_MANUAL_CONVERSION_WITH_LOWERCASE_SCHEMA
-- DMS statement_conversion_tool was called for all 6 statements but returned
-- converted_sql_count: 0 with message "No converted SQL found in target metadata models"
-- Manual conversion applied using DMS schema_mapping_tool output:
--   Source: [dbo].[Documents] -> Target: dps_dbo.documents (all lowercase columns)
-- DMS Schema Mapping confirmed: dbo.Documents -> dps_dbo.documents
-- DMS Statement Conversion Timestamps:
--   Statement 1: 2026-03-25T21:11:10.390876 (model: sql-conversion-1774473072)
--   Statement 2: 2026-03-25T21:11:58.316640 (model: sql-conversion-1774473120)
--   Statement 3: 2026-03-25T21:12:39.650877 (model: sql-conversion-1774473161)
--   Statement 4: 2026-03-25T21:13:17.940140 (model: sql-conversion-1774473199)
--   Statement 5: 2026-03-25T21:13:53.608518 (model: sql-conversion-1774473235)
--   Statement 6: 2026-03-25T21:14:31.546178 (model: sql-conversion-1774473273)
-- Schema Mapping Tool confirmed target DDL: dps_dbo.documents with all lowercase columns
-- ============================================================================

-- Statement 1: SELECT with WHERE and LIMIT
-- Source: Home.razor -> LoadDocuments()
-- DMS Statement Conversion Status: FAILED (converted_sql_count: 0, message: "No converted SQL found in target metadata models")
-- DMS Conversion Timestamp: 2026-03-25T21:11:10.390876
-- Manual Conversion: Applied lowercase schema mapping from DMS schema_mapping_tool
-- Conversion Method: DMS_FAILURE_MANUAL_CONVERSION_WITH_LOWERCASE_SCHEMA
-- Original: SELECT TOP 50 [d].[Id], [d].[FileName], [d].[OriginalFileName], [d].[FileExtension], [d].[FileSize], [d].[ContentType], [d].[StoragePath], [d].[Status], [d].[Summary], [d].[UploadedBy], [d].[IsDeleted] FROM [dbo].[Documents] AS [d] WHERE [d].[IsDeleted] = CAST(0 AS bit);
SELECT d.id, d.filename, d.originalfilename, d.fileextension, d.filesize, d.contenttype, d.storagepath, d.status, d.summary, d.uploadedby, d.isdeleted FROM dps_dbo.documents AS d WHERE d.isdeleted = CAST(0 AS BOOLEAN) LIMIT 50;

-- Statement 2: INSERT
-- Source: Home.razor -> UploadFiles()
-- DMS Statement Conversion Status: FAILED (converted_sql_count: 0, message: "No converted SQL found in target metadata models")
-- DMS Conversion Timestamp: 2026-03-25T21:11:58.316640
-- Manual Conversion: Applied lowercase schema mapping from DMS schema_mapping_tool
-- Conversion Method: DMS_FAILURE_MANUAL_CONVERSION_WITH_LOWERCASE_SCHEMA
-- Original: INSERT INTO [dbo].[Documents] ([Id], [FileName], [OriginalFileName], [FileExtension], [FileSize], [ContentType], [StoragePath], [Status], [Summary], [UploadedBy], [IsDeleted]) VALUES (@p0, @p1, @p2, @p3, @p4, @p5, @p6, @p7, @p8, @p9, @p10);
INSERT INTO dps_dbo.documents (id, filename, originalfilename, fileextension, filesize, contenttype, storagepath, status, summary, uploadedby, isdeleted) VALUES (@p0, @p1, @p2, @p3, @p4, @p5, @p6, @p7, @p8, @p9, @p10);

-- Statement 3: DELETE
-- Source: Home.razor -> DeleteDoc()
-- DMS Statement Conversion Status: FAILED (converted_sql_count: 0, message: "No converted SQL found in target metadata models")
-- DMS Conversion Timestamp: 2026-03-25T21:12:39.650877
-- Manual Conversion: Applied lowercase schema mapping from DMS schema_mapping_tool
-- Conversion Method: DMS_FAILURE_MANUAL_CONVERSION_WITH_LOWERCASE_SCHEMA
-- Original: DELETE FROM [dbo].[Documents] WHERE [Id] = @p0;
DELETE FROM dps_dbo.documents WHERE id = @p0;

-- Statement 4: SELECT by Primary Key
-- Source: DocumentProcessingService.cs -> ProcessDocumentAsync()
-- DMS Statement Conversion Status: FAILED (converted_sql_count: 0, message: "No converted SQL found in target metadata models")
-- DMS Conversion Timestamp: 2026-03-25T21:13:17.940140
-- Manual Conversion: Applied lowercase schema mapping from DMS schema_mapping_tool
-- Conversion Method: DMS_FAILURE_MANUAL_CONVERSION_WITH_LOWERCASE_SCHEMA
-- Original: SELECT TOP 1 [d].[Id], [d].[FileName], [d].[OriginalFileName], [d].[FileExtension], [d].[FileSize], [d].[ContentType], [d].[StoragePath], [d].[Status], [d].[Summary], [d].[UploadedBy], [d].[IsDeleted] FROM [dbo].[Documents] AS [d] WHERE [d].[Id] = @p0;
SELECT d.id, d.filename, d.originalfilename, d.fileextension, d.filesize, d.contenttype, d.storagepath, d.status, d.summary, d.uploadedby, d.isdeleted FROM dps_dbo.documents AS d WHERE d.id = @p0 LIMIT 1;

-- Statement 5: UPDATE
-- Source: DocumentProcessingService.cs -> ProcessDocumentAsync()
-- DMS Statement Conversion Status: FAILED (converted_sql_count: 0, message: "No converted SQL found in target metadata models")
-- DMS Conversion Timestamp: 2026-03-25T21:13:53.608518
-- Manual Conversion: Applied lowercase schema mapping from DMS schema_mapping_tool
-- Conversion Method: DMS_FAILURE_MANUAL_CONVERSION_WITH_LOWERCASE_SCHEMA
-- Original: UPDATE [dbo].[Documents] SET [Status] = @p0, [Summary] = @p1 WHERE [Id] = @p2;
UPDATE dps_dbo.documents SET status = @p0, summary = @p1 WHERE id = @p2;

-- Statement 6: CREATE TABLE (DDL)
-- Source: Program.cs -> Database.EnsureCreatedAsync()
-- DMS Statement Conversion Status: FAILED (converted_sql_count: 0, message: "No converted SQL found in target metadata models")
-- DMS Conversion Timestamp: 2026-03-25T21:14:31.546178
-- Manual Conversion: Applied DMS schema_mapping_tool target DDL output directly
-- Conversion Method: DMS_FAILURE_MANUAL_CONVERSION_WITH_LOWERCASE_SCHEMA
-- Original: CREATE TABLE [dbo].[Documents]([Id] uniqueidentifier NOT NULL, [FileName] nvarchar(max) NOT NULL, [OriginalFileName] nvarchar(max) NOT NULL, [FileExtension] nvarchar(max) NOT NULL, [FileSize] bigint NOT NULL, [ContentType] nvarchar(max) NOT NULL, [StoragePath] nvarchar(max) NOT NULL, [Status] int NOT NULL, [Summary] nvarchar(max) NULL, [UploadedBy] nvarchar(max) NOT NULL, [IsDeleted] bit NOT NULL, CONSTRAINT [PK_Documents] PRIMARY KEY ([Id]));
CREATE TABLE dps_dbo.documents (id UUID NOT NULL, filename CITEXT NOT NULL, originalfilename CITEXT NOT NULL, fileextension CITEXT NOT NULL, filesize BIGINT NOT NULL, contenttype CITEXT NOT NULL, storagepath CITEXT NOT NULL, status INTEGER NOT NULL, summary CITEXT NULL, uploadedby CITEXT NOT NULL, isdeleted BOOLEAN NOT NULL, CONSTRAINT pk_documents PRIMARY KEY (id));
