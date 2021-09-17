 USE [Curso]
 
CREATE TABLE [Aluno](
	[Id] INT NOT NULL ,
	[Nome] NVARCHAR(80) NOT NULL ,
	[Email] NVARCHAR(180) NOT NULL ,
	[Nascimento] DATETIME NULL,
	[Active] BIT DEFAULT(0), 

	CONSTRAINT [PK_Aluno] PRIMARY KEY ([Id]),
	CONSTRAINT [UQ_Aluno_Email] UNIQUE ([Email]),

)
GO 



ALTER TABLE [ALUNO]
	ALTER COLUMN [Active] BIT NOT NULL 

ALTER TABLE [ALUNO]
	DROP CONSTRAINT [PK_Aluno_]

DROP TABLE [Aluno]



--ALTER TABLE [Aluno]
--ADD [Document] NVARCHAR(11)

	
--ALTER TABLE [Aluno]
	--DROP COLUMN [Document] 

--ALTER TABLE [ALUNO]
--	ALTER COLUMN [DOCUMENT] CHAR(11)


CREATE INDEX [IX_Aluno_Email] ON [Aluno]([Email])
DROP INDEX [IX_Aluno_Email] ON [Aluno]

DROP TABLE [CURSO]
CREATE TABLE [Curso] (
	[Id] INT NOT NULL,
	[Nome] NVARCHAR(80) NOT NULL,
	[CategoriaId] INT NOT NULL,


	CONSTRAINT [PK_Curso] PRIMARY KEY([Id]),
	CONSTRAINT [FK_Curso_Categoria] FOREIGN KEY([CategoriaId]) 
		REFERENCES [Categoria]([Id])
	)
	GO

DROP TABLE [ProgressoCurso]
CREATE TABLE [ProgressoCurso] (
	[AlunoId] INT NOT NULL,
	[CursoId] INT NOT NULL,
	[Progresso] INT NOT NULL,
	[UltimaAtualizacao] DATETIME NOT NULL DEFAULT(GETDATE()),

	CONSTRAINT PK_ProgressoCurso PRIMARY KEY([AlunoId], [CursoId])
	)
	GO

CREATE TABLE [Categoria] (
	[Id] INT NOT NULL,
	[Nome] NVARCHAR(80) NOT NULL,

	CONSTRAINT [PK_Categoria] PRIMARY KEY([Id])
	)
	GO


===============================================================================================================

CREATE DATABASE [Cursos]
GO


USE [Cursos]
DROP TABLE Categoria
    CREATE TABLE [Categoria] (
	[Id] INT NOT NULL IDENTITY(1,1),
	[Nome] NVARCHAR(80) NOT NULL,

	CONSTRAINT [PK_Categoria] PRIMARY KEY([Id])
	)
	GO
DROP TABLE Curso
CREATE TABLE [Curso] (
	[Id] INT NOT NULL IDENTITY(1,1),
	[Nome] NVARCHAR(80) NOT NULL,
	[CategoriaId] INT NOT NULL,


	CONSTRAINT [PK_Curso] PRIMARY KEY([Id]),
	CONSTRAINT [FK_Curso_Categoria] FOREIGN KEY([CategoriaId]) 
		REFERENCES [Categoria]([Id])
	)
	GO

===============================================================================================================

select * from Categoria

INSERT INTO [Categoria]([Nome]) VALUES('Backend')
INSERT INTO [Categoria]([Nome]) VALUES('Frontend')
INSERT INTO [Categoria]([Nome]) VALUES('Mobile')


SELECT * FROM CURSO
INSERT INTO [Curso]([Nome], [CategoriaId]) VALUES('Fundamentos do C#', 1)
INSERT INTO [Curso]([Nome], [CategoriaId]) VALUES('Fundamentos OOP', 1)
INSERT INTO [Curso]([Nome], [CategoriaId]) VALUES('Angular', 2)
INSERT INTO [Curso]([Nome], [CategoriaId]) VALUES('Flutter', 3)
===============================================================================================================
SELECT * FROM [Course]
SELECT * FROM [Student]
SELECT * FROM [StudentCourse]

INSERT INTO
    [Student]
VALUES (
    '79b82071-80a8-4e78-a79c-92c8cd1fd052',
    'André Baltieri',
    'hello@balta.io',
    '12345678901',
    '12345678',
    NULL,
    GETDATE()
)

INSERT INTO
    [StudentCourse]
VALUES (
    '5f5a33f8-4ff3-7e10-cc6e-3fa000000000',
    '79b82071-80a8-4e78-a79c-92c8cd1fd052',
    50,
    0,
    '2020-01-13 12:35:54',
    GETDATE()
)
===============================================================================================================

CREATE DATABASE [balta]
GO

USE [balta]
GO

CREATE TABLE [Student]
(
    [Id] uniqueidentifier NOT NULL,
    [Name] NVARCHAR(120) NOT NULL,
    [Email] NVARCHAR(180) NOT NULL,
    [Document] NVARCHAR(20) NULL,
    [Phone] NVARCHAR(20) NULL,
    [Birthdate] DATETIME NULL,
    [CreateDate] DATETIME NOT NULL DEFAULT(GETDATE()),
    CONSTRAINT [PK_Student] PRIMARY KEY ([Id])
);
GO

CREATE TABLE [Author]
(
    [Id] uniqueidentifier NOT NULL,
    [Name] NVARCHAR(80) NOT NULL,
    [Title] NVARCHAR(80) NOT NULL,
    [Image] NVARCHAR(1024) NOT NULL,
    [Bio] NVARCHAR(2000) NOT NULL,
    [Url] nvarchar(450) NULL,
    [Email] NVARCHAR(160) NOT NULL,
    [Type] TINYINT NOT NULL, -- 0 a 255
    CONSTRAINT [PK_Author] PRIMARY KEY ([Id])
);
GO

CREATE TABLE [Career]
(
    [Id] uniqueidentifier NOT NULL,
    [Title] NVARCHAR(160) NOT NULL,
    [Summary] NVARCHAR(2000) NOT NULL,
    [Url] NVARCHAR(1024) NOT NULL,
    [DurationInMinutes] INT NOT NULL,
    [Active] BIT NOT NULL,
    [Featured] BIT NOT NULL,
    [Tags] NVARCHAR(160) NOT NULL,
    CONSTRAINT [PK_Career] PRIMARY KEY ([Id])
);
GO

CREATE TABLE [Category]
(
    [Id] uniqueidentifier NOT NULL,
    [Title] NVARCHAR(160) NOT NULL,
    [Url] NVARCHAR(1024) NOT NULL,
    [Summary] NVARCHAR(2000) NOT NULL,
    [Order] int NOT NULL,
    [Description] TEXT NOT NULL,
    [Featured] BIT NOT NULL,
    CONSTRAINT [PK_Category] PRIMARY KEY ([Id])
);
GO

CREATE TABLE [Course]
(
    [Id] uniqueidentifier NOT NULL,
    [Tag] NVARCHAR(20) NOT NULL,
    [Title] NVARCHAR(160) NOT NULL,
    [Summary] NVARCHAR(2000) NOT NULL,
    [Url] NVARCHAR(1024) NOT NULL,
    [Level] TINYINT NOT NULL,
    [DurationInMinutes] INT NOT NULL,
    [CreateDate] DATETIME NOT NULL,
    [LastUpdateDate] DATETIME NOT NULL,
    [Active] BIT NOT NULL,
    [Free] BIT NOT NULL,
    [Featured] BIT NOT NULL,
    [AuthorId] uniqueidentifier NOT NULL,
    [CategoryId] uniqueidentifier NOT NULL,
    [Tags] NVARCHAR(160) NOT NULL,
    CONSTRAINT [PK_Course] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Course_Author_AuthorId] FOREIGN KEY ([AuthorId]) REFERENCES [Author] ([Id]),
    CONSTRAINT [FK_Course_Category_CategoryId] FOREIGN KEY ([CategoryId]) REFERENCES [Category] ([Id])
);
GO

CREATE TABLE [CareerItem]
(
    [CareerId] uniqueidentifier NOT NULL,
    [CourseId] uniqueidentifier NOT NULL,
    [Title] NVARCHAR(160) NOT NULL,
    [Description] TEXT NOT NULL,
    [Order] TINYINT NOT NULL,
    
    CONSTRAINT [PK_CareerItem] PRIMARY KEY ([CourseId], [CareerId]),
    CONSTRAINT [FK_CareerItem_Career_CareerId] FOREIGN KEY ([CareerId]) REFERENCES [Career] ([Id]),
    CONSTRAINT [FK_CareerItem_Course_CourseId] FOREIGN KEY ([CourseId]) REFERENCES [Course] ([Id])
);
GO

CREATE TABLE [StudentCourse]
(
    [CourseId] uniqueidentifier NOT NULL,
    [StudentId] uniqueidentifier NOT NULL,
    [Progress] TINYINT NOT NULL,
    [Favorite] BIT NOT NULL,
    [StartDate] DATETIME NOT NULL,
    [LastUpdateDate] DATETIME NULL DEFAULT(GETDATE()),
    CONSTRAINT [PK_StudentCourse] PRIMARY KEY ([CourseId], [StudentId]),
    CONSTRAINT [FK_StudentCourse_Course_CourseId] FOREIGN KEY ([CourseId]) REFERENCES [Course] ([Id]),
    CONSTRAINT [FK_StudentCourse_Student_StudentId] FOREIGN KEY ([StudentId]) REFERENCES [Student] ([Id])
);
GO


=============================================================================

CREATE OR ALTER VIEW vwCourses as 
    select 
        co.Id,
        co.tag,
        co.Title,
        co.url,
        co.Summary,
        ct.Title as categoria,
        aut.Name as autor,

    from Course co
        inner JOIN Category ct on co.CategoryId = ct.Id
        INNER JOIN Author aut on co.AuthorId = aut.Id
    where Active = 1


==========================================================================================

INSERT INTO 
    [Student]  
VALUES (
    '01591328-c1b9-4fe9-b89f-fafab13ed087',
    'Andre Baltieri',
    'hello@balta.io',
    '12345678901',
    '12345678',
    '1980-01-01',
    GETDATE()
    
)

INSERT INTO 
    [StudentCourse]
VALUES (
    '5f5a33f8-4ff3-7e10-cc6e-3fa000000000',
    '01591328-c1b9-4fe9-b89f-fafab13ed087',
    50,
    0,
    GETDATE(),
       GETDATE()
)
===============================================================

SELECT COUNT ([COURSE].[Title])
   AS [Course],
   [Course].Title AS [Title],
    [Student].[Name] AS [Student],

    [StudentCourse].[Progress]
FROM
    [Course]
    LEFT JOIN [StudentCourse] ON [StudentCourse].[CourseId] = [Course].[Id]
    LEFT JOIN [Student] ON [StudentCourse].[StudentId]= [Student].[Id]
GROUP by [COURSE].[Title] , [Student].[Name],[StudentCourse].[Progress] 
ORDER by [Student] DESC






