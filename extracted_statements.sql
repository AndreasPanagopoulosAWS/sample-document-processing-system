-- ============================================================================
-- Extracted SQL Statements from DocumentProcessor.Web Application
-- Source: EF Core LINQ operations (no raw SQL in codebase)
-- These represent the SQL statements that EF Core generates for each operation
-- Extraction Date: 2026-03-25
-- ============================================================================

-- Statement 1: SELECT with WHERE and LIMIT
-- Source: Home.razor -> LoadDocuments() -> DB.Documents.Where(d => !d.IsDeleted).Take(50).ToListAsync()
-- Location: Components/Pages/Home.razor, LoadDocuments method
SELECT TOP 50 [d].[Id], [d].[FileName], [d].[OriginalFileName], [d].[FileExtension], [d].[FileSize], [d].[ContentType], [d].[StoragePath], [d].[Status], [d].[Summary], [d].[UploadedBy], [d].[IsDeleted] FROM [dbo].[Documents] AS [d] WHERE [d].[IsDeleted] = CAST(0 AS bit);

-- Statement 2: INSERT
-- Source: Home.razor -> UploadFiles() -> DB.Documents.AddAsync(doc) + DB.SaveChangesAsync()
-- Location: Components/Pages/Home.razor, UploadFiles method
INSERT INTO [dbo].[Documents] ([Id], [FileName], [OriginalFileName], [FileExtension], [FileSize], [ContentType], [StoragePath], [Status], [Summary], [UploadedBy], [IsDeleted]) VALUES (@p0, @p1, @p2, @p3, @p4, @p5, @p6, @p7, @p8, @p9, @p10);

-- Statement 3: DELETE
-- Source: Home.razor -> DeleteDoc() -> DB.Documents.Remove(_deleteDoc) + DB.SaveChangesAsync()
-- Location: Components/Pages/Home.razor, DeleteDoc method
DELETE FROM [dbo].[Documents] WHERE [Id] = @p0;

-- Statement 4: SELECT by Primary Key
-- Source: DocumentProcessingService.cs -> ProcessDocumentAsync() -> db.Documents.FindAsync(documentId)
-- Location: Services/DocumentProcessingService.cs, ProcessDocumentAsync method
SELECT TOP 1 [d].[Id], [d].[FileName], [d].[OriginalFileName], [d].[FileExtension], [d].[FileSize], [d].[ContentType], [d].[StoragePath], [d].[Status], [d].[Summary], [d].[UploadedBy], [d].[IsDeleted] FROM [dbo].[Documents] AS [d] WHERE [d].[Id] = @p0;

-- Statement 5: UPDATE
-- Source: DocumentProcessingService.cs -> ProcessDocumentAsync() -> db.SaveChangesAsync() after status/summary updates
-- Location: Services/DocumentProcessingService.cs, ProcessDocumentAsync method
UPDATE [dbo].[Documents] SET [Status] = @p0, [Summary] = @p1 WHERE [Id] = @p2;

-- Statement 6: CREATE TABLE (DDL)
-- Source: Program.cs -> Database.EnsureCreatedAsync()
-- Location: Program.cs, application startup
CREATE TABLE [dbo].[Documents]([Id] uniqueidentifier NOT NULL, [FileName] nvarchar(max) NOT NULL, [OriginalFileName] nvarchar(max) NOT NULL, [FileExtension] nvarchar(max) NOT NULL, [FileSize] bigint NOT NULL, [ContentType] nvarchar(max) NOT NULL, [StoragePath] nvarchar(max) NOT NULL, [Status] int NOT NULL, [Summary] nvarchar(max) NULL, [UploadedBy] nvarchar(max) NOT NULL, [IsDeleted] bit NOT NULL, CONSTRAINT [PK_Documents] PRIMARY KEY ([Id]));
