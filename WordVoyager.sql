--CREATE DATABASE WordVoyager;

--CREATE TABLE [User] (
--	UserId int primary key,
--	Username nvarchar(100),
--	Email nvarchar(100),
--	PasswordHash nvarchar(100),
--	RegistrationDate datetime
--);

--CREATE TABLE Article (
--	ArticleId int primary key,
--	Title nvarchar(100),
--	Content text,
--	PublishedDate datetime,
--	LastModifiedDate datetime,
--	AuthorId int,
--	CategoryId int,
--	foreign key (AuthorId) references [User](UserId),
--	foreign key (CategoryId) references Category(CategoryId)
--);

--CREATE TABLE Category (
--	CategoryId int primary key,
--	Name nvarchar(100),
--	Description text
--);

--CREATE TABLE Comment (
--	CommentId int primary key,
--	ArticleId int,
--	UserId int,
--	Content text,
--	CommentDate datetime,
--	foreign key(ArticleId) references Article(ArticleId),
--	foreign key(UserId) references [User](UserId)
--);

--CREATE TABLE Tag (
--	TagId int primary key,
--	Name nvarchar(100)
--);

--CREATE TABLE ArticleTag (
--	ArticleId int,
--	TagId int,
--	foreign key(ArticleId) references Article(ArticleId),
--	foreign key(TagId) references Tag(TagId)
--);

--CREATE TABLE Attachment (
--	AttachmentId int primary key,
--	ArticleId int,
--	FileName nvarchar(100),
--	FileType nvarchar(100),
--	FilePath nvarchar(100),
--	UploadDate datetime,
--	foreign key(ArticleId) references Article(ArticleId)
--);