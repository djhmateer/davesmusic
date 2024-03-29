/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 21/08/2019 14:30:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Jokes]    Script Date: 21/08/2019 14:30:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Jokes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NULL,
	[Content] [nvarchar](max) NULL,
	[Rating] [int] NOT NULL,
	[ImageURL] [nvarchar](max) NULL,
	[VideoURL] [nvarchar](max) NULL,
	[CreatedAt] [datetime] NOT NULL,
	[JokeType] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Jokes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Playlist]    Script Date: 21/08/2019 14:30:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Playlist](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AlbumID] [varchar](50) NOT NULL,
	[TrackID] [varchar](50) NULL,
	[TrackName] [nvarchar](255) NULL,
	[AlbumName] [nvarchar](255) NULL,
	[ArtistName] [nvarchar](255) NULL,
 CONSTRAINT [PK_Playlist] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tracks]    Script Date: 21/08/2019 14:30:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tracks](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TrackID] [nvarchar](50) NOT NULL,
	[TrackName] [nvarchar](255) NOT NULL,
	[ArtistName] [nvarchar](255) NOT NULL,
	[ArtistID] [nvarchar](50) NULL,
	[TrackPreviewURL] [nvarchar](255) NULL,
	[AlbumName] [nvarchar](255) NULL,
	[AlbumID] [nvarchar](50) NULL,
	[AlbumImageURL] [nvarchar](255) NULL,
	[AlbumDate] [datetime] NULL,
 CONSTRAINT [PK_Tracks] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserPlaylists]    Script Date: 21/08/2019 14:30:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserPlaylists](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](255) NOT NULL,
	[TrackID] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_UserPlaylists] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Votes]    Script Date: 21/08/2019 14:30:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Votes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IPAddress] [nvarchar](max) NULL,
	[CreatedAt] [datetime] NOT NULL,
	[Joke_ID] [int] NULL,
 CONSTRAINT [PK_dbo.Votes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201606211246065_InitialCreate', N'SolidJokes.Core.DB.Session', 0x1F8B0800000000000400ED594B6FE33610BE17E87F10746A8BAC65273DB481BD0BAF932CBCDD3C1A278BDE02461A3B44294A25A9206ED15FD6437F52FF42877A5012E987EC6C168BA2C825226786F3F838331CFFF3D7DFC3374F31F31E41489AF0913FE8F57D0F789844942F467EA6E6AF7EF0DFBCFEFAABE169143F791F2BBA234D879C5C8EFC07A5D2E32090E103C444F6621A8A442673D50B93382051121CF6FB3F0683410028C247599E37BCCEB8A231E41FF839497808A9CA083B4F2260B25CC79D592ED5BB2031C8948430F26709A3D1FBE45790BD4922A077F2D6F7C68C12D464066CEE7B84F34411857A1EDF4A982991F0C52CC505C26E962920DD9C3009A5FEC735795753FA87DA94A066AC4485995449BCA3C0C151E99BC066DFCBC3BEF11D7AEF14BDAC96DAEADC83235FFBCDF7EC838E274C6822D7B945387A7AE5C0B3360F0C1C1035FAEFC09B644C6502461C3225083BF0AEB27B46C39F6079836C7CC433C69A0AA28AB8D75AC0A52B91A420D4F21AE6A5DAD313DF0BDA7C81CD68D81A3C855153AE8E0E7DEF020F27F70C4CFC1B0E982934E81D701044417445940281E19B46907BD039DD3AEB862A06D5718838BC3CBE774E9E3E005FA887918FFFFADE197D82A85A2955B8E514EF1A322991C1B653F09628D4E7C5CFB9469F68C19BBDB759C634260BB8BDFEF0E2CA7EA411249FE3A089008D8DB1F1FF097EDE6012DBD937FA0A691146654C5BBD7A719BB40BF24817396C6D57240AA4EF5D03CB77E5034D4BE17AE7AEB8FB672289AF135692E78B7737442C40DB95D83BB32413A1A5C230A8D3CAC664A3C5EC916C34DBFFC966C35957E3281220E5970CF9B5202D50B83B462B24BA18ADD0DB0DA3596C95C3E2D24DE519238BBA37D8AB446A824F865C0C5504822D31B44D64B5DD7C0EF13D88966B3F1296E147DF09498B364F9B8678B099F8E72CBFC925F1E166E22B1A6AE30CF9D166F231A7B106D9BBE99961F9DE0D6611B6E6E258CA24A479701AF9A64050FBBC531E796BE15467E0225D9D636C688AD140F48CFCEF1CE5570933F9B39DCE6D61FD5E6F605BD6B0C2CDA5BAE013CA8DAF6678E9F3BED0412736BA25406579B56DADB5BC19A80654307FD497A4A5B663729BB9AC330E73E1408BB961605B4279D71BFB4E22B073F5A6401A258D7E4117F62A740DF6D2377609681BB222D79868D5AF97A078BE54CF9C60CD3B67784ED214EF79E3DD53AE78B3E2D1337935DBFD351017328250AE7814186DCD495895B067B37675D719C119155261F227F74427C749143B641536D740A73AA5093F373E15A02A6AFD7F097DE7D5D75B0591DA7367684C8C0535B70BACF0BA6CF9539330225614F649C2B298AF6B0E367197EF82A68072A9BB0CD3F537A598C5EE72AAAEBE29A65AEB2EA5EEEB5B5E31ABDD25D58D7B5352BDBA8387EA36A5E5A37AB9BBACBA23688AAA575D49C3C0429C0DEBC0C1B59559EC4BD2E90A1549EE995728CFD8BB5FA1D56C2F73851ADD6E4B48BDFCB24079E9F0B6CB8A1BE3B24C6E0D6349D72554BA10AE783AB60AA2EB874EB1CD45AC0AB076833974177DCAFABEA73E3BAB828935A2794F3995FA8D631E041DACB47B0437DE4EAB609318B49996C16A0D866599DE3E2775EA7641E27B68FA2366595DB3975241DCD304BDD96F6CC2685E532A8273C2E91CA42A1E25FE617F70D81BFF9EF7F6AD81EB9733FC0CA48C588709E8679F0A50EDD7ADEFFE1DE748ADA9237F24227C20E29B983C7DDB14B5C764F159B2DAD3C3DCF067CE0E9FA58E3D1F7C9E9FEC8148849FEA53CC00B7FB69B7B1DB7F03E1CEA8EB0B8ADE9D65BBF3269FF2089E46FE1F39CFB137FDE5AE643BF02E05A6D763AFEFFDB9D9867531DF67F651F7113B8D289C77F31E3313C418080D01C230D34825B0F6397DD495A03CA429614D7DDDB2DF05B7DA71469CBD730229700DC8A64D5DCED9D0DB1899D6F5D966F88EF31FF729BE7DCAB376C853B4037809EE130C6981C0D5A38F55F39FB5E39F5562570E645E6832D4B4B97EEF6F1B0639F3A39799FFB8CD1B62A4F153388253D2452D42B7A31CC2163A0CCD94CF930AA59646158995B6CE4111CC79642C149D9350E176A8C736BA5C97A3D7D3F81EA229BFCC549A293419E27BD6FA4542837DD3F9F990ABADF3F032CD67FD9FC2045493EAB47DC9DF66944546EFB31505738D087D8BCA1AA563A974AD5A2C8DA48B84771454BACF5CFE1B885386C2E4259F9147D847B75B091F6041C265D583AF17B23D106DB70F4F28590812CB5246CD8F9F88E1287E7AFD2F0738375A11220000, N'6.1.1-30610')
GO
SET IDENTITY_INSERT [dbo].[Playlist] ON 
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (227, N'3KuXEGcqLcnEYWnn3OEGy0', N'40pPI2TbaYSZlKfV44HRjn', N'Supremacy', N'The 2nd Law', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (228, N'3KuXEGcqLcnEYWnn3OEGy0', N'0c4IEciLCDdXEhhKxj4ThA', N'Madness', N'The 2nd Law', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (229, N'3KuXEGcqLcnEYWnn3OEGy0', N'1tjHKKI0r82IB5KL29whHs', N'Panic Station', N'The 2nd Law', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (230, N'3KuXEGcqLcnEYWnn3OEGy0', N'3V78QkKzy5bIy0goZj3L8u', N'Prelude', N'The 2nd Law', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (231, N'3KuXEGcqLcnEYWnn3OEGy0', N'2IFqUmfW8oQoKn6ToxKsMs', N'Survival', N'The 2nd Law', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (232, N'3KuXEGcqLcnEYWnn3OEGy0', N'6r9tjMWLv8fNdZKKTnqCEr', N'Follow Me', N'The 2nd Law', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (233, N'3KuXEGcqLcnEYWnn3OEGy0', N'2raJLzvNRvipP8cJuchk6U', N'Animals', N'The 2nd Law', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (234, N'3KuXEGcqLcnEYWnn3OEGy0', N'0rlB9MM5FKeRnvJiWOVRYY', N'Explorers', N'The 2nd Law', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (235, N'3KuXEGcqLcnEYWnn3OEGy0', N'630CQp2prewTfH1UAvMgCA', N'Big Freeze', N'The 2nd Law', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (236, N'3KuXEGcqLcnEYWnn3OEGy0', N'3MbkURW6xUuXYMyZz08qDo', N'Save Me', N'The 2nd Law', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (237, N'3KuXEGcqLcnEYWnn3OEGy0', N'4AKRf8MaMfsc1pgpR5e3X9', N'Liquid State', N'The 2nd Law', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (238, N'3KuXEGcqLcnEYWnn3OEGy0', N'21lhern14mW8gwK2oOqMbP', N'The 2nd Law: Unsustainable', N'The 2nd Law', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (239, N'3KuXEGcqLcnEYWnn3OEGy0', N'4nr4gSTFGmTTSbumSY3kfH', N'The 2nd Law: Isolated System', N'The 2nd Law', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (240, N'0eFHYz8NmK75zSplL5qlfM', N'4VqPOruhp5EdPBeR92t6lQ', N'Uprising', N'The Resistance', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (241, N'0eFHYz8NmK75zSplL5qlfM', N'1C2QJNTmsTxCDBuIgai8QV', N'Resistance', N'The Resistance', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (242, N'0eFHYz8NmK75zSplL5qlfM', N'0It6VJoMAare1zdV2wxqZq', N'Undisclosed Desires', N'The Resistance', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (243, N'0eFHYz8NmK75zSplL5qlfM', N'0tHbQRjL5phd8OoYl2Bdnd', N'United States Of Eurasia [+Collateral Damage]', N'The Resistance', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (244, N'0eFHYz8NmK75zSplL5qlfM', N'7jZ5A8bf63qYaUXfuGoxVk', N'Guiding Light', N'The Resistance', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (245, N'0eFHYz8NmK75zSplL5qlfM', N'28FJMlLUu9NHuwlZWFKDn7', N'Unnatural Selection', N'The Resistance', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (246, N'0eFHYz8NmK75zSplL5qlfM', N'0MrkZz4D3fGlEkhebjPPrh', N'MK Ultra', N'The Resistance', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (247, N'0eFHYz8NmK75zSplL5qlfM', N'114rzL6VEy9bb3amPcY3tw', N'I Belong To You [+Mon Coeur S''Ouvre A Ta Voix]', N'The Resistance', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (248, N'0eFHYz8NmK75zSplL5qlfM', N'6zkhhG8iQ8waiwGkQuhoE1', N'Exogenesis: Symphony Part 1 [Overture]', N'The Resistance', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (249, N'0eFHYz8NmK75zSplL5qlfM', N'39kUTBz4uJoy5VtmIybz9D', N'Exogenesis: Symphony Part 2 [Cross-pollination]', N'The Resistance', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (250, N'0eFHYz8NmK75zSplL5qlfM', N'76ZDwA8uTyMys4LIS3pBUX', N'Exogenesis: Symphony Part 3 [Redemption]', N'The Resistance', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (251, N'3wAdN3V06Btox7NjFfBKRC', N'1FNZq0NV4yymW1wEjIi2eY', N'That Was Just Your Life', N'Death Magnetic', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (252, N'3wAdN3V06Btox7NjFfBKRC', N'5Z1fNpUSmmRseYFMlJldKo', N'The End Of The Line', N'Death Magnetic', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (253, N'3wAdN3V06Btox7NjFfBKRC', N'5IpHNGT95ldM7zqYvvCi04', N'Broken, Beat & Scarred', N'Death Magnetic', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (254, N'3wAdN3V06Btox7NjFfBKRC', N'26i37IFvFmC3517jxxZAJP', N'The Day That Never Comes', N'Death Magnetic', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (255, N'3wAdN3V06Btox7NjFfBKRC', N'6VpUZlL6wGaVm98gGUs8Qq', N'All Nightmare Long', N'Death Magnetic', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (256, N'3wAdN3V06Btox7NjFfBKRC', N'2V6yO7x7gQuaRoPesMZ5hr', N'Cyanide', N'Death Magnetic', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (257, N'3wAdN3V06Btox7NjFfBKRC', N'6xcpkEEppRQOqmo5MWflyF', N'The Unforgiven III', N'Death Magnetic', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (258, N'3wAdN3V06Btox7NjFfBKRC', N'1gOIcx7HGmOJU1bWOyyGFN', N'The Judas Kiss', N'Death Magnetic', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (259, N'3wAdN3V06Btox7NjFfBKRC', N'0DfFc2HY28tnsuw9XIT1JC', N'Suicide & Redemption', N'Death Magnetic', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (260, N'3wAdN3V06Btox7NjFfBKRC', N'20hFFeL5QykY9VWeV5RayW', N'My Apocalypse', N'Death Magnetic', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (261, N'4kwN2OnnrwY2ZBcm379Ahn', N'6Yc26elzS6HaXvG0oI3AUi', N'Frantic', N'St. Anger', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (262, N'4kwN2OnnrwY2ZBcm379Ahn', N'309o3PJag8FugLJTRTZa77', N'St. Anger', N'St. Anger', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (263, N'4kwN2OnnrwY2ZBcm379Ahn', N'3sDGCyIl3KevvdcYB5x6np', N'Some Kind Of Monster', N'St. Anger', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (264, N'4kwN2OnnrwY2ZBcm379Ahn', N'3qr1b8xGZEJEHdwNzXFZum', N'Dirty Window', N'St. Anger', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (265, N'4kwN2OnnrwY2ZBcm379Ahn', N'5z53vQiBCYtpjFeWiZIhmM', N'Invisible Kid', N'St. Anger', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (266, N'4kwN2OnnrwY2ZBcm379Ahn', N'1eWCFuF6N518k36wZteBEN', N'My World', N'St. Anger', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (267, N'4kwN2OnnrwY2ZBcm379Ahn', N'26ThPeBphPhlQzzXjzJ7JU', N'Shoot Me Again', N'St. Anger', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (268, N'4kwN2OnnrwY2ZBcm379Ahn', N'4LGxUtbeH1jOTeGdR636i7', N'Sweet Amber', N'St. Anger', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (269, N'4kwN2OnnrwY2ZBcm379Ahn', N'4RCJ2xbTfJalOq7RtTsOPv', N'The Unnamed Feeling', N'St. Anger', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (270, N'4kwN2OnnrwY2ZBcm379Ahn', N'5zmbojPlEp4de0HOrw6Ncv', N'Purify', N'St. Anger', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (271, N'4kwN2OnnrwY2ZBcm379Ahn', N'7ftmYVN6VQMJ1PgzcHkkfg', N'All Within My Hands', N'St. Anger', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (272, N'7HcHPb1P9mubh0vyDdawAv', N'0mCS6W4eGouKP8WjvcZOJ7', N'The Ecstasy Of Gold (Live with the SFSO)', N'S&M', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (273, N'7HcHPb1P9mubh0vyDdawAv', N'2u0m9H0byqN12Ho1Jh1lQh', N'The Call Of Ktulu (Live with the SFSO)', N'S&M', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (274, N'7HcHPb1P9mubh0vyDdawAv', N'5zsf8OkgBQoxPPtL11pQCk', N'Master Of Puppets (Live with the SFSO)', N'S&M', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (275, N'7HcHPb1P9mubh0vyDdawAv', N'57U9JRGUXtHko5Jc2liyKT', N'Of Wolf And Man (Live with the SFSO)', N'S&M', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (276, N'7HcHPb1P9mubh0vyDdawAv', N'22f0HfO1PUGJ3bjVozEewR', N'The Thing That Should Not Be (Live with the SFSO)', N'S&M', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (277, N'7HcHPb1P9mubh0vyDdawAv', N'784N3wAWOqGHdODVvnHluw', N'Fuel (Live with the SFSO)', N'S&M', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (278, N'7HcHPb1P9mubh0vyDdawAv', N'3Z4zABLK7CRjC6JZdf5Ago', N'The Memory Remains (Live with the SFSO)', N'S&M', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (279, N'7HcHPb1P9mubh0vyDdawAv', N'0epHEsqwVe2Viyc02QHdu8', N'No Leaf Clover (Live with the SFSO)', N'S&M', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (280, N'7HcHPb1P9mubh0vyDdawAv', N'6CegLoiZXSdPSyexrf8Ju3', N'Hero Of The Day (Live with the SFSO)', N'S&M', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (281, N'7HcHPb1P9mubh0vyDdawAv', N'5jcwJsJTlxy2QLFFnjRnxw', N'Devil''s Dance (Live with the SFSO)', N'S&M', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (282, N'7HcHPb1P9mubh0vyDdawAv', N'7iUZUlXN9DrDHUX6YKqVTY', N'Bleeding Me (Live with the SFSO)', N'S&M', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (283, N'7HcHPb1P9mubh0vyDdawAv', N'6R2MWNoXJ2UKYLDQZrZFy6', N'Nothing Else Matters (Live with the SFSO)', N'S&M', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (284, N'7HcHPb1P9mubh0vyDdawAv', N'2Fp00zUfmyiwCXjwcCVPVv', N'Until It Sleeps (Live with the SFSO)', N'S&M', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (285, N'7HcHPb1P9mubh0vyDdawAv', N'6eE09AcVjekkR2rWz9GY6C', N'For Whom The Bell Tolls (Live with the SFSO)', N'S&M', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (286, N'7HcHPb1P9mubh0vyDdawAv', N'0zDOB6LOKYfgByM7wHor9K', N'- Human (Live with the SFSO)', N'S&M', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (287, N'7HcHPb1P9mubh0vyDdawAv', N'0QTz48ypYxaUdPX4qFzz6y', N'Wherever I May Roam (Live with the SFSO)', N'S&M', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (288, N'7HcHPb1P9mubh0vyDdawAv', N'2AoUPcthWEu4zcEU6yj6Tt', N'Outlaw Torn (Live with the SFSO)', N'S&M', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (289, N'7HcHPb1P9mubh0vyDdawAv', N'4RqI5bDMlDDdBj3dTpJbre', N'Sad But True (Live with the SFSO)', N'S&M', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (290, N'7HcHPb1P9mubh0vyDdawAv', N'6C5TFmm7D2YKsKiLJgT03K', N'One (Live with the SFSO)', N'S&M', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (291, N'7HcHPb1P9mubh0vyDdawAv', N'5HTpET0Y8mzzaqYQiBDhmx', N'Enter Sandman (Live with the SFSO)', N'S&M', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (292, N'7HcHPb1P9mubh0vyDdawAv', N'6oFkYgA97CaQOBOeDwG1DT', N'Battery (Live with the SFSO)', N'S&M', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (293, N'5EsaepzZjkLvl784u0eB9t', N'2ejw3zqMVdhkGbkdFVZVxk', N'Sting Me', N'The Southern Harmony And Musical Companion', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (294, N'5EsaepzZjkLvl784u0eB9t', N'6llJQueoTgqptK1HVUJBSI', N'Remedy', N'The Southern Harmony And Musical Companion', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (295, N'5EsaepzZjkLvl784u0eB9t', N'4dVHnlcE9kQOrzFrjMl2eN', N'Thorn In My Pride', N'The Southern Harmony And Musical Companion', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (296, N'5EsaepzZjkLvl784u0eB9t', N'6dozJ9KMMq6aEdcRQGIIiH', N'Bad Luck Blue Eyes Goodbye', N'The Southern Harmony And Musical Companion', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (297, N'5EsaepzZjkLvl784u0eB9t', N'38EPNznpj4LLwIX4eOtaCu', N'Sometimes Salvation', N'The Southern Harmony And Musical Companion', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (298, N'5EsaepzZjkLvl784u0eB9t', N'6Vo6lNhKAWTvYHUoJgdpCu', N'Hotel Illness', N'The Southern Harmony And Musical Companion', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (299, N'5EsaepzZjkLvl784u0eB9t', N'1gZIvTD05nukEzjgWfBvVi', N'Black Moon Creeping', N'The Southern Harmony And Musical Companion', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (300, N'5EsaepzZjkLvl784u0eB9t', N'2TmuNr4EHiKvErH22snaG2', N'No Speak No Slave', N'The Southern Harmony And Musical Companion', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (301, N'5EsaepzZjkLvl784u0eB9t', N'7I6ZNUPYq4dnKucuwkymuK', N'My Morning Song', N'The Southern Harmony And Musical Companion', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (302, N'5EsaepzZjkLvl784u0eB9t', N'4BXNnTsrIMxxqdqeRtdsA6', N'Time Will Tell', N'The Southern Harmony And Musical Companion', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (303, N'6QU6itggAYKtzjKOMqz8Ch', N'6bv7GJ12vZtPxbJF61GZpF', N'Twice As Hard', N'Shake Your Money Maker', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (304, N'6QU6itggAYKtzjKOMqz8Ch', N'3TxkuaIEUv53lEflPskcN8', N'Jealous Again', N'Shake Your Money Maker', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (305, N'6QU6itggAYKtzjKOMqz8Ch', N'7Lt3E6laIUeKv5fZSR8cWT', N'Sister Luck', N'Shake Your Money Maker', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (306, N'6QU6itggAYKtzjKOMqz8Ch', N'5kIx0L2zoJhqNs5a3DVgE5', N'Could I''ve Been So Blind', N'Shake Your Money Maker', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (307, N'6QU6itggAYKtzjKOMqz8Ch', N'5eMnNIvoLg6M8jfu4BavL2', N'Seeing Things', N'Shake Your Money Maker', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (308, N'6QU6itggAYKtzjKOMqz8Ch', N'0N7LKqYxUrg5UFb6Z4OSDF', N'Hard To Handle', N'Shake Your Money Maker', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (309, N'6QU6itggAYKtzjKOMqz8Ch', N'6CTWaV70GECKdTLp1SLQ8R', N'Thick N'' Thin', N'Shake Your Money Maker', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (310, N'6QU6itggAYKtzjKOMqz8Ch', N'37431qrKdYaPF0idZ7o1Zr', N'She Talks To Angels', N'Shake Your Money Maker', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (311, N'6QU6itggAYKtzjKOMqz8Ch', N'0jDUVTzofijums7RkuK38H', N'Struttin'' Blues', N'Shake Your Money Maker', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (312, N'6QU6itggAYKtzjKOMqz8Ch', N'7xLYiaol8ndOHWQBA6lfMQ', N'Stare It Cold', N'Shake Your Money Maker', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (313, N'0lw68yx3MhKflWFqCsGkIs', N'4jrCMOG9OPe6iF4vWFxatb', N'Take a Bow', N'Black Holes And Revelations', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (314, N'0lw68yx3MhKflWFqCsGkIs', N'3skn2lauGk7Dx6bVIt5DVj', N'Starlight', N'Black Holes And Revelations', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (315, N'0lw68yx3MhKflWFqCsGkIs', N'3lPr8ghNDBLc2uZovNyLs9', N'Supermassive Black Hole', N'Black Holes And Revelations', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (316, N'0lw68yx3MhKflWFqCsGkIs', N'5YXr4AGfUQpLSxtFSsKUh6', N'Map Of The Problematique', N'Black Holes And Revelations', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (317, N'0lw68yx3MhKflWFqCsGkIs', N'6jH5aCuXgtygWpx7BF54at', N'Soldier''s Poem', N'Black Holes And Revelations', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (318, N'0lw68yx3MhKflWFqCsGkIs', N'2zmR3FG7iOGDAdwrVPzdg9', N'Invincible', N'Black Holes And Revelations', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (319, N'0lw68yx3MhKflWFqCsGkIs', N'6JnFVmPyJvjnfBag0hhIFa', N'Assassin', N'Black Holes And Revelations', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (320, N'0lw68yx3MhKflWFqCsGkIs', N'20vZII9Yu52czI9Fk4p39r', N'Exo-Politics', N'Black Holes And Revelations', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (321, N'0lw68yx3MhKflWFqCsGkIs', N'3Sno9FE8r2uz8QP0MtnTPL', N'City Of Delusion', N'Black Holes And Revelations', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (322, N'0lw68yx3MhKflWFqCsGkIs', N'0EkE0ripJ9OFNzvZANzo5C', N'Hoodoo', N'Black Holes And Revelations', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (323, N'0lw68yx3MhKflWFqCsGkIs', N'7ouMYWpwJ422jRcDASZB7P', N'Knights Of Cydonia', N'Black Holes And Revelations', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (324, N'0lw68yx3MhKflWFqCsGkIs', N'6IfitwQQ1Gu9g9QnLWDHRY', N'Glorious', N'Black Holes And Revelations', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (338, N'00GMnZ71KyvmEnZfqcsFP4', N'2BsqXN1LH76kAqjegAAsTZ', N'Dancing Queen', N'Abba Gold Anniversary Edition', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (339, N'00GMnZ71KyvmEnZfqcsFP4', N'5CneYQz33XzOZKBeMOTwFO', N'Knowing Me, Knowing You', N'Abba Gold Anniversary Edition', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (340, N'00GMnZ71KyvmEnZfqcsFP4', N'5FUbjEhsAV6SnuA33qhiGa', N'Take A Chance On Me', N'Abba Gold Anniversary Edition', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (341, N'00GMnZ71KyvmEnZfqcsFP4', N'4EcCZJiu87nY1EdGtTs1TC', N'Mamma Mia', N'Abba Gold Anniversary Edition', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (342, N'00GMnZ71KyvmEnZfqcsFP4', N'2Eti9d7wbABR3WKviUuzV8', N'Lay All Your Love On Me', N'Abba Gold Anniversary Edition', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (343, N'00GMnZ71KyvmEnZfqcsFP4', N'77KOV2BXCOQM2rvC52v4Gd', N'Super Trouper', N'Abba Gold Anniversary Edition', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (344, N'00GMnZ71KyvmEnZfqcsFP4', N'7ag8e1oEnmws1UVx0dxw5Y', N'I Have A Dream', N'Abba Gold Anniversary Edition', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (345, N'00GMnZ71KyvmEnZfqcsFP4', N'0hByIDFmdFv8f6DejefIft', N'The Winner Takes It All', N'Abba Gold Anniversary Edition', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (346, N'00GMnZ71KyvmEnZfqcsFP4', N'72FUO1NFsAUYCMEk7ZL3mL', N'Money, Money, Money', N'Abba Gold Anniversary Edition', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (347, N'00GMnZ71KyvmEnZfqcsFP4', N'1qg0zw8yNgfeClchuFXvWD', N'S.O.S.', N'Abba Gold Anniversary Edition', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (348, N'00GMnZ71KyvmEnZfqcsFP4', N'0YGeDaUHvgVt3gEinZcpoY', N'Chiquitita', N'Abba Gold Anniversary Edition', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (349, N'00GMnZ71KyvmEnZfqcsFP4', N'3nMU3nDklCdzzNJW0FueBS', N'Fernando', N'Abba Gold Anniversary Edition', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (350, N'00GMnZ71KyvmEnZfqcsFP4', N'0ayyT5zbXqlXEQWoa0JggL', N'Voulez-Vous', N'Abba Gold Anniversary Edition', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (351, N'00GMnZ71KyvmEnZfqcsFP4', N'32KlLADzuIxZmHfhOdXMdC', N'Gimme! Gimme! Gimme! (A Man After Midnight)', N'Abba Gold Anniversary Edition', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (352, N'00GMnZ71KyvmEnZfqcsFP4', N'2JIVeQQvIdyQvrz9Mhi6qL', N'Does Your Mother Know', N'Abba Gold Anniversary Edition', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (353, N'00GMnZ71KyvmEnZfqcsFP4', N'1MTF3KweV9ntqiOeP5KWt5', N'One Of Us', N'Abba Gold Anniversary Edition', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (354, N'00GMnZ71KyvmEnZfqcsFP4', N'7004vnGNsbGknoZanPA73k', N'The Name Of The Game', N'Abba Gold Anniversary Edition', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (355, N'00GMnZ71KyvmEnZfqcsFP4', N'6uVfYIY1HhkhVoomfVLF2P', N'Thank You For The Music', N'Abba Gold Anniversary Edition', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (356, N'00GMnZ71KyvmEnZfqcsFP4', N'7HI44W4E02t3DefnrBCTvX', N'Waterloo', N'Abba Gold Anniversary Edition', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (357, N'00GMnZ71KyvmEnZfqcsFP4', N'30844qGbUl2Z70njqROPwe', N'Summer Night City', N'Abba Gold Anniversary Edition', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (358, N'00GMnZ71KyvmEnZfqcsFP4', N'3nydleCAFFMqeTVlgjGaUe', N'Angel Eyes', N'Abba Gold Anniversary Edition', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (359, N'00GMnZ71KyvmEnZfqcsFP4', N'0dnOroZwyVmIvIL9Gqvfrj', N'The Day Before You Came', N'Abba Gold Anniversary Edition', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (360, N'00GMnZ71KyvmEnZfqcsFP4', N'30OAOWY18H9bHl5BC78vTE', N'Eagle - Short Version', N'Abba Gold Anniversary Edition', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (361, N'00GMnZ71KyvmEnZfqcsFP4', N'3NyoaCkN9YUjx7LSID06P7', N'I Do, I Do, I Do, I Do, I Do', N'Abba Gold Anniversary Edition', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (362, N'00GMnZ71KyvmEnZfqcsFP4', N'4GVkqWE7bqpmWhVvy9d8VL', N'So Long', N'Abba Gold Anniversary Edition', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (363, N'00GMnZ71KyvmEnZfqcsFP4', N'7fBC5hsVNcPWvyifsaxhrP', N'Honey, Honey', N'Abba Gold Anniversary Edition', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (364, N'00GMnZ71KyvmEnZfqcsFP4', N'1ak5NYGdh8LnKnl5JM9FKo', N'The Visitors', N'Abba Gold Anniversary Edition', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (365, N'00GMnZ71KyvmEnZfqcsFP4', N'3eD67BNq5t5ri4pOX5AkzH', N'Our Last Summer', N'Abba Gold Anniversary Edition', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (366, N'00GMnZ71KyvmEnZfqcsFP4', N'7qzcLl2lTz4J4GYheVAH4h', N'On And On And On', N'Abba Gold Anniversary Edition', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (367, N'00GMnZ71KyvmEnZfqcsFP4', N'3b0Nr6Y18tveQmFiU1M1KQ', N'Ring Ring - English Version', N'Abba Gold Anniversary Edition', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (368, N'00GMnZ71KyvmEnZfqcsFP4', N'38CDh9Z7eoqzke85dvvePw', N'I Wonder (Departure)', N'Abba Gold Anniversary Edition', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (369, N'00GMnZ71KyvmEnZfqcsFP4', N'2l9SsVPFLHWYN7inUHP4Z4', N'Lovelight - Original Version', N'Abba Gold Anniversary Edition', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (370, N'00GMnZ71KyvmEnZfqcsFP4', N'75Jf7iinHZY8Qg51Rb04Ex', N'Head Over Heels', N'Abba Gold Anniversary Edition', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (371, N'00GMnZ71KyvmEnZfqcsFP4', N'2SLdCfAWKhECmnu8IjcVIZ', N'When I Kissed The Teacher', N'Abba Gold Anniversary Edition', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (372, N'00GMnZ71KyvmEnZfqcsFP4', N'5z58zzeyUkUomHg2e8nQRI', N'I Am The City', N'Abba Gold Anniversary Edition', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (373, N'00GMnZ71KyvmEnZfqcsFP4', N'0G1AF5qpIb9lhvaVibKjCN', N'Cassandra', N'Abba Gold Anniversary Edition', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (374, N'00GMnZ71KyvmEnZfqcsFP4', N'1sGY94hq2FkUdDZNrSwWWE', N'Under Attack', N'Abba Gold Anniversary Edition', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (375, N'00GMnZ71KyvmEnZfqcsFP4', N'1tvUYA1lqu1bYPM6TvjvI7', N'When All Is Said And Done', N'Abba Gold Anniversary Edition', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (376, N'00GMnZ71KyvmEnZfqcsFP4', N'5m4KjEBmgDVWAErNwSdtNx', N'The Way Old Friends Do - Live At Wembley Arena, London, England / 1979', N'Abba Gold Anniversary Edition', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (377, N'00GMnZ71KyvmEnZfqcsFP4', N'6XqaycqO8r8BQm9kAFP8Dm', N'She''s My Kind Of Girl', N'Abba Gold Anniversary Edition', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (378, N'00GMnZ71KyvmEnZfqcsFP4', N'5GhB8ZvCId4BbA1mXcrT78', N'I Am Just A Girl', N'Abba Gold Anniversary Edition', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (379, N'00GMnZ71KyvmEnZfqcsFP4', N'0yVYDQy7hT1rJd2tNDqUAb', N'Gonna Sing You My Love Song', N'Abba Gold Anniversary Edition', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (380, N'00GMnZ71KyvmEnZfqcsFP4', N'6xIt3zfH5vnNQ3nCDbaUP6', N'King Kong Song', N'Abba Gold Anniversary Edition', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (381, N'00GMnZ71KyvmEnZfqcsFP4', N'15HAR4J1UIVwGNI0pbyRP9', N'I''ve Been Waiting For You', N'Abba Gold Anniversary Edition', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (382, N'00GMnZ71KyvmEnZfqcsFP4', N'77KYAMBVZlurqcwshSwnI1', N'Rock Me', N'Abba Gold Anniversary Edition', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (383, N'00GMnZ71KyvmEnZfqcsFP4', N'1NNP9rBRmr2aCehIXyfDBN', N'Man In The Middle', N'Abba Gold Anniversary Edition', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (384, N'00GMnZ71KyvmEnZfqcsFP4', N'2T1393juMpD8Gg3t4zkhCD', N'Intermezzo No.1', N'Abba Gold Anniversary Edition', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (385, N'00GMnZ71KyvmEnZfqcsFP4', N'7kIjsEXg3hA55wJoTX5RtL', N'That''s Me', N'Abba Gold Anniversary Edition', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (386, N'00GMnZ71KyvmEnZfqcsFP4', N'5f1kl9sMRO5aKiMQS7zkT2', N'Crazy World', N'Abba Gold Anniversary Edition', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (387, N'00GMnZ71KyvmEnZfqcsFP4', N'3yBOe8roOX1Y1ZI8v0Gt4P', N'Happy Hawaii', N'Abba Gold Anniversary Edition', NULL)
GO
SET IDENTITY_INSERT [dbo].[Playlist] OFF
GO
SET IDENTITY_INSERT [dbo].[Tracks] ON 
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (24, N'0c4IEciLCDdXEhhKxj4ThA', N'Madness', N'Muse', N'12Chz98pHFMPJEknJQMWvI', N'https://p.scdn.co/mp3-preview/014c44998d46b5a2e52f9b75d1c28a187247d3c8', N'The 2nd Law', N'3KuXEGcqLcnEYWnn3OEGy0', N'https://i.scdn.co/image/2b412376036f7bc4394a120b9b7281442a6c2357', CAST(N'2012-09-24T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (25, N'4VqPOruhp5EdPBeR92t6lQ', N'Uprising', N'Muse', N'12Chz98pHFMPJEknJQMWvI', N'https://p.scdn.co/mp3-preview/4fcb9dc0aa51f0f5e4f95ef550a813a89d9c395d', N'The Resistance', N'0eFHYz8NmK75zSplL5qlfM', N'https://i.scdn.co/image/f6500569e0b98137a6d26eee33286c5bb9ff623c', CAST(N'2009-09-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (26, N'3skn2lauGk7Dx6bVIt5DVj', N'Starlight', N'Muse', N'12Chz98pHFMPJEknJQMWvI', N'https://p.scdn.co/mp3-preview/0e946239cd2f8264b27f2ffb1e5ff0718290f679', N'Black Holes And Revelations', N'0lw68yx3MhKflWFqCsGkIs', N'https://i.scdn.co/image/6c751d61a730ab14dca55b1c7d3ce1f7f838aa23', CAST(N'2006-06-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (29, N'1UBQ5GK8JaQjm5VbkBZY66', N'Sharp Dressed Man (2008 Remastered LP Version)', N'ZZ Top', N'2AM4ilv6UzW0uMRuqKtDgN', N'https://p.scdn.co/mp3-preview/cde2a145ad66d756ef1717a97ed1841ee7048cfb', N'Eliminator', N'5LMGAYhn2ywaxGZdtmXGpw', N'https://i.scdn.co/image/832cbab41aa6239e672eb785f2ec3cbf788855ff', CAST(N'1983-03-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (30, N'7t6CAWplijBj4sdl0q3z0e', N'Legs (2008 Remastered Album Edit Version)', N'ZZ Top', N'2AM4ilv6UzW0uMRuqKtDgN', N'https://p.scdn.co/mp3-preview/b51737840dd206542d0ee61e479ac1269003987e', N'Eliminator', N'5LMGAYhn2ywaxGZdtmXGpw', N'https://i.scdn.co/image/832cbab41aa6239e672eb785f2ec3cbf788855ff', CAST(N'1983-03-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (31, N'11cPCZ0BYWJmAm7N8eDxtu', N'Johnny B. Goode - Single Version', N'Chuck Berry', N'293zczrfYafIItmnmM3coR', N'https://p.scdn.co/mp3-preview/aeb87cfd86fe72b286a83ebf34ff58b1f2374dd2', N'Berry Is On Top', N'2W3GOisQj5XAFbtxmbDBr5', N'https://i.scdn.co/image/a635693a4a861e794f6de41e853ad33849a7855a', CAST(N'1959-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (32, N'0N7LKqYxUrg5UFb6Z4OSDF', N'Hard To Handle', N'The Black Crowes', N'5krkohEVJYw0qoB5VWwxaC', N'https://p.scdn.co/mp3-preview/2d530e5a72343412463ad526ebb4acc6a89b0fec', N'Shake Your Money Maker', N'6QU6itggAYKtzjKOMqz8Ch', N'https://i.scdn.co/image/2f77e2ce3d040f113e420a0a18666c9f5ec43ddf', CAST(N'1990-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (35, N'1AhDOtG9vPSOmsWgNW0BEY', N'Bohemian Rhapsody - Remastered 2011', N'Queen', N'1dfeR4HaWDbWqFHLkxsg1d', N'https://p.scdn.co/mp3-preview/0fae7e2f08f20f23cb5393b2bd8291e1db6c7da9', N'A Night At The Opera (2011 Remaster)', N'1TSZDcvlPtAnekTaItI3qO', N'https://i.scdn.co/image/05e237f63c31eb4941753e5fb171e31cfca6a877', CAST(N'1975-11-21T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (36, N'4pbJqGIASGPr0ZpGpnWkDn', N'We Will Rock You - Remastered 2011', N'Queen', N'1dfeR4HaWDbWqFHLkxsg1d', N'https://p.scdn.co/mp3-preview/182947e6d8b9a048948cb74afd2675cb6dce135f', N'News Of The World (2011 Remaster)', N'7tB40pGzj6Tg0HePj2jWZt', N'https://i.scdn.co/image/249cb44ec1b26a567ae996bcea62fb8226910899', CAST(N'1977-10-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (37, N'32OlwWuMpZ6b0aN2RZOeMS', N'Uptown Funk', N'Mark Ronson', N'3hv9jJF3adDNsBSIQDqcjp', N'https://p.scdn.co/mp3-preview/57fbea25cab128a8ec695af69e58dd5a98ba1e7c', N'Uptown Special', N'3vLaOYCNCzngDf8QdBg2V1', N'https://i.scdn.co/image/ae0c6b9da25cd8c02c958fd4998b1807c9238e07', CAST(N'2015-01-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (40, N'7LygtNjQ65PSdzVjUnHXQb', N'Cherry Pie', N'Warrant', N'7HLvzuM9p11k9lUQfSM4Rq', N'https://p.scdn.co/mp3-preview/ad7b0fa8685ba6a4d4a3831b494b612989b3360d', N'Cherry Pie', N'4LgsHyufRmmcB1HIqTES19', N'https://i.scdn.co/image/dfa1cedc593f6cb06adfc8fc830fe5e3d3eec440', CAST(N'1990-10-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (41, N'6mcxQ1Y3uQRU0IHsvdNLH1', N'Where Is My Mind? (Remastered)', N'Pixies', N'6zvul52xwTWzilBZl6BUbT', N'https://p.scdn.co/mp3-preview/f5b45332151a7dab439016940779c9524fc8e1bd', N'Surfer Rosa & Come On Pilgrim', N'2l7RPWC3E6eStJJLBsUeCI', N'https://i.scdn.co/image/9bf3ad2f0954dd692d5894a31ff33b2163ec62f0', CAST(N'1988-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (47, N'3ixTiPABjqkBKPocxq6oIe', N'Don’t Look Back In Anger', N'Oasis', N'2DaxqgrOhkeH0fpeiQq2f4', N'https://p.scdn.co/mp3-preview/5b909eee48080a4d0e444057bb7b23fd9b363ff1', N'(What''s The Story) Morning Glory', N'0PTVq4kaAAuROnfvfA7bHG', N'https://i.scdn.co/image/489eb5c23a3e4cce5e643cf30e381fbe29b97b62', CAST(N'1995-10-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (59, N'5XkVQZWvsVwedk0Jv54SVH', N'Buddy Holly', N'Weezer', N'3jOstUTkEu2JkjvRdBA5Gu', N'https://p.scdn.co/mp3-preview/138d6210e60391d7c20d3c81861d92476082dd70', N'Weezer (Deluxe Edition)', N'0cK7vsvVwqgGaBLorT1g81', N'https://i.scdn.co/image/51e0817fe60ebc8bc1e30a43f73e59113b155edb', CAST(N'1994-05-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (60, N'3E14pb0zKtI9ugTGzWOOjU', N'Beverly Hills', N'Weezer', N'3jOstUTkEu2JkjvRdBA5Gu', N'https://p.scdn.co/mp3-preview/e4737232fa5cdc79bd1f2122d2cd3e93f1ab4dee', N'Make Believe', N'2FaklyHPw1MkZEkNsCtUh9', N'https://i.scdn.co/image/8f2a8cab6de59e2c00f25c59f4c9e8fc517809f6', CAST(N'2005-05-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (62, N'6L89mwZXSOwYl76YXfX13s', N'Basket Case', N'Green Day', N'7oPftvlwr6VrsViSDV7fJY', N'https://p.scdn.co/mp3-preview/11f6cc57f1287ee01712d57fe43117594d4774ba', N'Dookie', N'4uG8q3GPuWHQlRbswMIRS6', N'https://i.scdn.co/image/eae6056da5ef1ff130aef71732388b1d51af5d30', CAST(N'1994-02-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (63, N'6nTiIhLmQ3FWhvrGafw2zj', N'American Idiot', N'Green Day', N'7oPftvlwr6VrsViSDV7fJY', N'https://p.scdn.co/mp3-preview/c11e19521150a5903b2ab0fa011cac0bdda00ae4', N'American Idiot', N'5dN7F9DV0Qg1XRdIgW8rke', N'https://i.scdn.co/image/0a652bf1398c7b303a2572863275d78bf43ee37e', CAST(N'2004-09-21T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (64, N'6ORqU0bHbVCRjXm9AjyHyZ', N'Good Riddance [Time Of Your Life]', N'Green Day', N'7oPftvlwr6VrsViSDV7fJY', N'https://p.scdn.co/mp3-preview/ab55176a69558e232b064c0b8aecbaf1eecb91f0', N'Nimrod', N'3x2uer6Xh0d5rF8toWpRDA', N'https://i.scdn.co/image/2eb4c098545701d9225ca873694c865bd67823fc', CAST(N'1997-10-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (65, N'2C5l2dK6ep2JRgQ9UenCBs', N'Next to Me', N'Emeli Sandé', N'7sfgqEdoeBTjd8lQsPT3Cy', N'https://p.scdn.co/mp3-preview/fdfa0d1264feb5d554d5fdfce943287040d58acb', N'Our Version of Events (Special Edition)', N'2Z58ts5QbxC3UZxukFC0Fe', N'https://i.scdn.co/image/4a32cb2ad961342cb1fd39f078204a5be099845c', CAST(N'2012-10-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (66, N'5fpj84RsT9cOTfWUCxBTXu', N'Little Monster', N'Royal Blood', N'2S5hlvw4CMtMGswFtfdK15', N'https://p.scdn.co/mp3-preview/7ff2ff1144102850befc7257ef5cf58504cf4fd7', N'Royal Blood', N'0BFzNaeaNv4mahOzwZFGHK', N'https://i.scdn.co/image/73be37c49f4e2a4ce3d95b139b7031857e1674dd', CAST(N'2014-08-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (67, N'6QPKYGnAW9QozVz2dSWqRg', N'Someone Like You', N'Adele', N'4dpARuHxo51G3z768sgnrY', N'https://p.scdn.co/mp3-preview/aa4fb9677f6ee863e81acd26cfd59a63156b2e11', N'21', N'7n3QJc7TBOxXtlYh4Ssll8', N'https://i.scdn.co/image/847a0813c21d86900ad08f74487267d68482468a', CAST(N'2011-01-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (68, N'174oVPYb0RogxSyQXqlUWx', N'Baby I Call Hell', N'Deap Vally', N'1NsvfeRzexfHjhUGqWrULl', N'https://p.scdn.co/mp3-preview/8aa885840afd3abd6cc49353d2d2f21cc73d675a', N'Sistrionix (Deluxe Version)', N'2fjUsg4Et4Aj1sQvkeofU5', N'https://i.scdn.co/image/36c6c2d6d15ff3ed1029a5571b3c2992ef2135a1', CAST(N'2013-06-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (78, N'5ERnPWGQc5QK7M7HW3rjC6', N'Paranoid', N'Black Sabbath', N'5M52tdBnJaKSvOpJGz8mfZ', N'https://p.scdn.co/mp3-preview/ead22582dbac29f7e7104fa60c9fa2c532ffe7b0', N'Paranoid (Remastered)', N'7DBES3oV6jjAmWob7kJg6P', N'https://i.scdn.co/image/22046ce2b8e0d559c5364b31b7616edeac85a114', CAST(N'1970-09-18T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (84, N'2LlA15ivxoM2Oi3Q4vGtHV', N'Money Money Money', N'Swedish Hitz Goes Metal', N'5kcL6tVVEBIgiHkXW9JVWo', N'https://p.scdn.co/mp3-preview/07f99f5521de6696cb652d742275506612f0c533', N'Swedish Hitz Goes Metal', N'3ndX2U8fXry44j5PUbjHib', N'https://i.scdn.co/image/7776ae5a75cdb14b4b067294f665ccc0fa948e00', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (85, N'3gHIINSk3F9nBowhz8HJuh', N'Mamma Mia', N'Swedish Hitz Goes Metal', N'5kcL6tVVEBIgiHkXW9JVWo', N'https://p.scdn.co/mp3-preview/3a8781955a37a6bfc15149aa3770c3d07b8a9012', N'Swedish Hitz Goes Metal', N'3ndX2U8fXry44j5PUbjHib', N'https://i.scdn.co/image/7776ae5a75cdb14b4b067294f665ccc0fa948e00', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (86, N'7o2CTH4ctstm8TNelqjb51', N'Sweet Child O'' Mine', N'Guns N'' Roses', N'3qm84nBOXUEQ2vnTfUTTFC', N'https://p.scdn.co/mp3-preview/d60e195c264a34a378850e278ae62d9753ae253e', N'Appetite For Destruction', N'3I9Z1nDCL4E0cP62flcbI5', N'https://i.scdn.co/image/d9503afbbd8f9a2580ff0bcc3437bf7b68fc016c', CAST(N'1987-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (87, N'3YBZIN3rekqsKxbJc9FZko', N'Paradise City', N'Guns N'' Roses', N'3qm84nBOXUEQ2vnTfUTTFC', N'https://p.scdn.co/mp3-preview/f1a29168a20b3a376380893a4a5083486e07ca9e', N'Appetite For Destruction', N'3I9Z1nDCL4E0cP62flcbI5', N'https://i.scdn.co/image/d9503afbbd8f9a2580ff0bcc3437bf7b68fc016c', CAST(N'1987-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (88, N'53968oKecrFxkErocab2Al', N'November Rain', N'Guns N'' Roses', N'3qm84nBOXUEQ2vnTfUTTFC', N'https://p.scdn.co/mp3-preview/82cbd402ae833a68f5976e8b0b002462fa299255', N'Use Your Illusion I', N'4L5pz06MVlsWaTEjSQPN8h', N'https://i.scdn.co/image/6482585994240cbb5d27edc1d1560ef205e30940', CAST(N'1991-09-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (89, N'2C4aYxNpoPkmoZ3ZdPeuOB', N'Knockin'' On Heaven''s Door', N'Guns N'' Roses', N'3qm84nBOXUEQ2vnTfUTTFC', N'https://p.scdn.co/mp3-preview/e82a38d95af666562c2073144bb711d11ffe5051', N'Use Your Illusion II', N'0yMBzueqNjfhtmhz0AthB7', N'https://i.scdn.co/image/fccb5b4a09c57cb4b929c4b07c31e809808a82c5', CAST(N'1991-09-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (90, N'7dblNGnRXEBrVJunazs2U5', N'All I Have To Do Is Dream', N'The Everly Brothers', N'4ACplpEqD6JIVgKrafauzs', N'https://p.scdn.co/mp3-preview/d57b77a0edda0b5ecab307e5892b2123ef2ecf21', N'The Very Best of The Everly Brothers', N'4lmdDGcU5u1xk3GCcVJSYT', N'https://i.scdn.co/image/a142a9f20d8b4ae849f1c11a582585791545c670', CAST(N'1964-08-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (92, N'1KQwTDBlfsZBjV7qElWnmS', N'Great Balls Of Fire', N'Jerry Lee Lewis', N'2zyz0VJqrDXeFDIyrfVXSo', N'https://p.scdn.co/mp3-preview/04ee66cd25370bd021c5e35c0a89d11fda1669bf', N'Great Balls Of Fire (Soundtrack)', N'028nK0vG9BEFMeqOuH6A3i', N'https://i.scdn.co/image/1c8bbc0a30913ac5838754465b988fba1edd3527', CAST(N'1989-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (96, N'3SdTKo2uVsxFblQjpScoHy', N'Stand By Me', N'Ben E. King', N'3plJVWt88EqjvtuB4ZDRV3', N'https://p.scdn.co/mp3-preview/97fbf8aa998bb32d07176583ec5dfa2d1a1ffe08', N'Don''t Play That Song', N'18Fj7coTfyMi7mEPXIweN7', N'https://i.scdn.co/image/09d5549a9a9711471eef3c697b1683e9dae4e97c', CAST(N'1962-08-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (98, N'5GWHzvmJIrGQ5F4m7MUtfN', N'Tutti Frutti', N'Little Richard', N'4xls23Ye9WR9yy3yYMpAMm', N'https://p.scdn.co/mp3-preview/7bd584a4e2b543af8fe21a5fc6370c1a96564b06', N'The Gold Collection', N'0hyzSiJY6YjK7ryjlF9F6i', N'https://i.scdn.co/image/13400af84de4adb1ad76aa5a50bf65f9f52a004d', CAST(N'1964-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (99, N'4sFbojhVXQv7dBC9PVCcRn', N'Sympathy For The Devil', N'The Rolling Stones', N'22bE4uQ6baNwSHPVcDxLCe', N'https://p.scdn.co/mp3-preview/71ece2e6dd27348e9278c5e775c6dda0c9a0a067', N'Beggars Banquet', N'5WZFtmADuJUZPtt0NER0Qi', N'https://i.scdn.co/image/a981f00b6d4d937bbdb91037ab17c19d3ae1432f', CAST(N'1968-12-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (101, N'7uEcCGtM1FBBGIhPozhJjv', N'Daydream Believer', N'The Monkees', N'320EPCSEezHt1rtbfwH6Ck', N'https://p.scdn.co/mp3-preview/f7eae7c9ed21b018058e28721806a4d4ce232cf8', N'The Birds, The Bees, & The Monkees', N'2Ov6zb7NfgDh3EXSIIWrb2', N'https://i.scdn.co/image/2f631c76d139818351929de99a2b84ba49df90dd', CAST(N'1968-04-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (102, N'7s25THrKz86DM225dOYwnr', N'Respect', N'Aretha Franklin', N'7nwUJBm0HE4ZxD3f5cy5ok', N'https://p.scdn.co/mp3-preview/a0a0a5d876c3d99ef20e9f182cb008313dfc5953', N'I Never Loved A Man The Way I Love You', N'5WndWfzGwCkHzAbQXVkg2V', N'https://i.scdn.co/image/54ba56769399a48eb84c636c756495ee21d6be18', CAST(N'1967-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (103, N'46iPLIwKPJ1b3A4whrCi3z', N'Wild Thing', N'The Troggs', N'57xdnSVt4ahJCIXYLieQ25', N'https://p.scdn.co/mp3-preview/6607f975f48f2c154737b42509675079bbd13cdb', N'The EP Collection', N'6pkehOrKvn7X6CiaKxiHBB', N'https://i.scdn.co/image/f5b8724c7e2b9a2920eafa6706b834dbe0b4021b', CAST(N'1996-03-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (104, N'225xvV8r1yKMHErSWivnow', N'I Don''t Want to Miss a Thing', N'Aerosmith', N'7Ey4PD4MYsKc5I2dolUwbH', N'https://p.scdn.co/mp3-preview/496ef6af1c78774d7a3e92e2d74b9f55c255cebd', N'Armageddon - The Album', N'4f7HKjBnjpMsDBDTHYV890', N'https://i.scdn.co/image/6ac06a7ff59b7772092fa499a1134a5451e42d5c', CAST(N'1998-06-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (105, N'1QEEqeFIZktqIpPI4jSVSF', N'More Than a Feeling', N'Boston', N'29kkCKKGXheHuoO829FxWK', N'https://p.scdn.co/mp3-preview/e46c0115840a62bd44b54a5d32a76d9248e0e710', N'Boston', N'2QLp07RO6anZHmtcKTEvSC', N'https://i.scdn.co/image/bd4cf4b1fe860eb599b6bc423f9a1954a96a7058', CAST(N'1976-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (106, N'70C4NyhjD5OZUMzvWZ3njJ', N'Piano Man', N'Billy Joel', N'6zFYqv1mOsgBRQbae3JJ9e', N'https://p.scdn.co/mp3-preview/ded5694d43a39b57eb50d61e45c136be7aa67baa', N'Piano Man (Legacy Edition)', N'69wjSAZXZiD2EBia3b3gxL', N'https://i.scdn.co/image/ab5bb90e2caaacc817332c2109206863921b0e6e', CAST(N'1973-11-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (107, N'2zvot9pY2FNl1E94kc4K8M', N'Rocket Man (I Think It''s Going To Be A Long Long Time)', N'Elton John', N'3PhoLpVuITZKcymswpck5b', N'https://p.scdn.co/mp3-preview/1024dcf805d0172ca4299076b38d97134424fb5c', N'Honky Chateau (Remastered)', N'46g6b33tbttcPtzbwzBoG6', N'https://i.scdn.co/image/c3581519b056a17b9056fa579536e9788868464d', CAST(N'1972-05-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (108, N'51pQ7vY7WXzxskwloaeqyj', N'Stairway To Heaven', N'Led Zeppelin', N'36QJpDe2go2KgaRleHCDTp', N'https://p.scdn.co/mp3-preview/752da50bddc3a4352a6ad3548735dad34e3ebe63', N'Led Zeppelin IV', N'1Ugdi2OTxKopVVqsprp5pb', N'https://i.scdn.co/image/17d8f6bb03d0fd34c3085df9841d14647729d40f', CAST(N'1971-11-08T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (109, N'6kjlvJLh2DBsSQtqVzFh8I', N'Immigrant Song', N'Led Zeppelin', N'36QJpDe2go2KgaRleHCDTp', N'https://p.scdn.co/mp3-preview/80730039a88661a239a95ff2d93c4d5557902b65', N'Led Zeppelin III', N'1u5BsuBK45mLwrbqdASN3g', N'https://i.scdn.co/image/1c594cffcb8616f906a87b83dfed5fc8bb0e228c', CAST(N'1970-10-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (115, N'12qZHAeOyTf93YAWvGDTat', N'All The Small Things', N'blink-182', N'6FBDaR13swtiWwGhX1WQsP', N'https://p.scdn.co/mp3-preview/dcdb5d3f8c420e42051260e9279a1ce508148d63', N'Enema Of The State', N'1fF8kYX49s5Ufv4XEY5sjW', N'https://i.scdn.co/image/054e9707bcd025cc8d26d4edc7481b3e1ec2e32a', CAST(N'1999-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (116, N'7woZGXjtaYwuvSoU1zToB3', N'Free Fallin''', N'Tom Petty', N'2UZMlIwnkgAEDBsw1Rejkn', N'https://p.scdn.co/mp3-preview/b888df59a036795db0dffdd70a679b239003d876', N'Full Moon Fever', N'7ihweYjA1ck66NTB4bujGl', N'https://i.scdn.co/image/0a822f7a08b6653c2f8091193ad18ff24775a4b3', CAST(N'1989-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (117, N'11d9oUiwHuYt216EFA2tiz', N'Ice Ice Baby', N'Vanilla Ice', N'7GXXMm3DB1VswVcuGyInUd', N'https://p.scdn.co/mp3-preview/c11bbb1d1961f05bf85089c0baadc8ca72808a3d', N'To The Extreme', N'1LHacvoBTd7o2d7wwQ9EZD', N'https://i.scdn.co/image/481e4c8695191a87d628d1ac37408ffb53fa2639', CAST(N'1990-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (118, N'78TnMTAFmWUWWCgNXR7D3K', N'Listen To Your Heart', N'Roxette', N'2SHhfs4BiDxGQ3oxqf0UHY', N'https://p.scdn.co/mp3-preview/b7499a36fb4dd7945dec4233d41f5c852b6c30ef', N'Look Sharp!', N'1iI5YZkqNUV7VmrEi4uOP9', N'https://i.scdn.co/image/6e5746d5a2c7a8b013dec731d32dfb63d119c7a4', CAST(N'1988-10-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (120, N'1B75hgRqe7A4fwee3g3Wmu', N'U Can''t Touch This', N'MC Hammer', N'2rblp9fJo16ZPTcKDtlmKW', N'https://p.scdn.co/mp3-preview/39ee9dfdd69ec5f121cf89e8cfefc1fedbe072e6', N'Please Hammer Don''t Hurt ''Em', N'4r1WecJyt5FOhglysp9zhN', N'https://i.scdn.co/image/79d22f962d688dd7255765248f3d4dc4817d92c1', CAST(N'1990-02-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (121, N'5xzN3p8DlPv7bBhV8mCdao', N'In Da Club', N'50 Cent', N'3q7HBObVc0L8jNeTe5Gofh', N'https://p.scdn.co/mp3-preview/6050ba5cf1863a423bb128edd2b5cc44ff5661df', N'Get Rich Or Die Tryin''', N'12hpmbw6mQSdjQH0zsqtoz', N'https://i.scdn.co/image/cc75d9e4c242f922e8ee8a744f5a527b398c1201', CAST(N'2003-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (123, N'7w9bgPAmPTtrkt2v16QWvQ', N'Lose Yourself - Soundtrack Version', N'Eminem', N'7dGJo4pcD2V6oG8kP0tJRR', N'https://p.scdn.co/mp3-preview/fbaf230cc8b34eaf186acbbe604256de7d9e61d4', N'Curtain Call (Deluxe Explicit)', N'71xFWYFtiHC8eP99QB30AA', N'https://i.scdn.co/image/384bc66fc7be0283e6898a98050c4adca5022cb5', CAST(N'2005-12-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (126, N'6vR4LDbi4H6iwC3YDUL6jT', N'Great Balls Of Fire', N'Jerry Lee Lewis', N'2zyz0VJqrDXeFDIyrfVXSo', N'https://p.scdn.co/mp3-preview/5776350147f88529bc608f8ff99a32551c964655', N'Jerry Lee''s Greatest', N'1EpJ6FtwpTrITdh1yfZhYI', N'https://i.scdn.co/image/6ac1b29dad667c7d9e241b247ab095cd2dbe41d9', CAST(N'1961-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (127, N'52HAHV1j93s5B8GoTNI7DJ', N'Oh, Pretty Woman', N'Roy Orbison', N'0JDkhL4rjiPNEp92jAgJnS', N'https://p.scdn.co/mp3-preview/66d4d61af48f85a823440d91badf92be5ba50036', N'Oh, Pretty Woman', N'2jTbcSPVTBRAoc3mHU6hy0', N'https://i.scdn.co/image/50506bc01038ae5458b81be132dfeacfafe91de2', CAST(N'1966-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (128, N'6r20M5DWYdIoCDmDViBxuz', N'You Got It', N'Roy Orbison', N'0JDkhL4rjiPNEp92jAgJnS', N'https://p.scdn.co/mp3-preview/7244af2900dd2c0c528b8cea11a9b1165e24240b', N'Mystery Girl', N'1UPcuqLY9PC99fQAqWgrSU', N'https://i.scdn.co/image/a92f450cee86fdae257f7c2f09511f9bdcf54c79', CAST(N'1989-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (129, N'1pRndXCyYuNxurrSqtWw5Y', N'The Twist', N'Chubby Checker', N'7qQJQ3YtcGlqaLg5tcypN2', N'https://p.scdn.co/mp3-preview/92c69eea52b707cfc6562958e5d464fdf29a83e5', N'Chubby Checker Classics', N'36tc0l1brbD9CCaUDrvqVi', N'https://i.scdn.co/image/34719293f15a9f49bafa4fe818a742e8e47b0f50', CAST(N'1962-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (130, N'7haFcQaoTBr2qY6G0r4JSH', N'I Say A Little Prayer', N'Aretha Franklin', N'7nwUJBm0HE4ZxD3f5cy5ok', N'https://p.scdn.co/mp3-preview/6793067b413b9c3441e11e3e7ccd894003583f5c', N'The Very Best Of Aretha Franklin - The 60''s', N'1R11sCrAEB6FkvuWBia8cT', N'https://i.scdn.co/image/1afb674d13854f128c417dffb03668f0e79984eb', CAST(N'1994-03-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (131, N'4ue5ET9msGNJSO6sSbrCVE', N'I Want To Break Free - Remastered 2011', N'Queen', N'1dfeR4HaWDbWqFHLkxsg1d', N'https://p.scdn.co/mp3-preview/ca84e762d950a3d368227c1f8b07853b3062d898', N'The Works (2011 Remaster)', N'5RS9xkMuDmeVISqGDBmnSa', N'https://i.scdn.co/image/1154f43474fc3deaabb9eff2139d235f92709072', CAST(N'1984-02-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (132, N'1lCRw5FEZ1gPDNPzy1K4zW', N'We Are The Champions - Remastered 2011', N'Queen', N'1dfeR4HaWDbWqFHLkxsg1d', N'https://p.scdn.co/mp3-preview/71bdf7bd286b14c135f0781bde5c7a4f2fb48035', N'News Of The World (2011 Remaster)', N'7tB40pGzj6Tg0HePj2jWZt', N'https://i.scdn.co/image/249cb44ec1b26a567ae996bcea62fb8226910899', CAST(N'1977-10-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (133, N'5SZ6zX4rOrEQferfFC2MfP', N'Walk This Way', N'Aerosmith', N'7Ey4PD4MYsKc5I2dolUwbH', N'https://p.scdn.co/mp3-preview/858e0e2c49fc535fe5ebe9b238610cae599bfbc3', N'Toys In The Attic', N'36IxIOGEBAXVozDSiVs09B', N'https://i.scdn.co/image/06bb2838ee0f658b39809f86a14b5ca0fd48c62b', CAST(N'1975-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (134, N'2cBGl1Ehr1D9xbqNmraqb4', N'Crazy', N'Aerosmith', N'7Ey4PD4MYsKc5I2dolUwbH', N'https://p.scdn.co/mp3-preview/4550968cbe65298466c78a1294852a5cf8838515', N'Get A Grip (Reissue - Remaster)', N'6BZNF93Ac0zqWD1n9TgFOq', N'https://i.scdn.co/image/7cd3bc5bc79bf0fffe08642da9d87f56a4960e7a', CAST(N'1993-04-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (135, N'1blHMFNrpEafM2GG5K5pnm', N'Dude (Looks Like A Lady)', N'Aerosmith', N'7Ey4PD4MYsKc5I2dolUwbH', N'https://p.scdn.co/mp3-preview/10d0b23987f565ad7b8d3e1e26539e1c34e1039d', N'Permanent Vacation (Remastered)', N'3mb4bSC1wKWTtQBfiMkyma', N'https://i.scdn.co/image/0b1fcf7b94c86968e7d123a75fb2a19fb6fa39d5', CAST(N'1987-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (136, N'7D7tJseXUZAxhg7l8RbTOj', N'Crazy Crazy Nights', N'KISS', N'07XSN3sPlIlB2L2XNcTwJw', N'https://p.scdn.co/mp3-preview/1eb1180a05a251e2864c7d83888394eb25eeff52', N'Crazy Nights (Remastered Version)', N'20C4ft1hM6sICitdBEsMZa', N'https://i.scdn.co/image/5fbec9ab8590d8fe9283eaae9d6ab63c8caf11ae', CAST(N'1987-09-18T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (137, N'39J10NL0mFTAdJbapoo2rC', N'Poison', N'Alice Cooper', N'3EhbVgyfGd7HkpsagwL9GS', N'https://p.scdn.co/mp3-preview/129e4fd94882b2cfe246089fcbd087980f26c4c5', N'Trash', N'033cvSPAuSU5ArRfIgQSDU', N'https://i.scdn.co/image/12bdb3992033c1463198d7348a4ad7de5604e69d', CAST(N'1989-07-25T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (138, N'1HlGblweLq0eAwnb0NY1EQ', N'18 And Life', N'Skid Row', N'4opTS86dN9uO313J9CE8xg', N'https://p.scdn.co/mp3-preview/36de535d21bd5b73cf20237706f8568519b99788', N'Skid Row', N'0kSTuMp9GpX9pJR45Bksgi', N'https://i.scdn.co/image/575e4242de17f562c911d4bba6b47a28d0ca5bb3', CAST(N'1989-01-24T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (139, N'4qO03RMQm88DdpTJcxlglY', N'Call Me', N'Blondie', N'4tpUmLEVLCGFr93o8hFFIB', N'https://p.scdn.co/mp3-preview/60488afe86cda6189bfb32e32f8e329e7c504058', N'Once More Into The Bleach', N'3KqhlIxtnXfWJfi445kI8X', N'https://i.scdn.co/image/44ae0605293e8abc03e1a920d15cba741a951db6', CAST(N'1988-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (140, N'5C0LFQARavkPpn7JgA4sLk', N'Every Breath You Take - 2003 Stereo Remastered Version', N'The Police', N'5NGO30tJxFlKixkPSgXcFE', N'https://p.scdn.co/mp3-preview/e07bce513e9aee99693e1b43fbe4620f957c5496', N'Synchronicity (Remastered)', N'28eOriEfl7IGbQDNvWIWXK', N'https://i.scdn.co/image/97e26b150fbdfedae969cc8ce38683d0a04f6c36', CAST(N'1990-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (141, N'3FmAUR4SPWa3P1KyDf21Fu', N'Roxanne - 2003 Stereo Remastered Version', N'The Police', N'5NGO30tJxFlKixkPSgXcFE', N'https://p.scdn.co/mp3-preview/a0a1c4d68dcf876987cfa978a9bae05a906964b7', N'Outlandos D''Amour (Remastered)', N'3D9JqZG5Q1ptOJr8ZQ0j7I', N'https://i.scdn.co/image/3e15d666168e4055578d5cdb965a64dad543a2bf', CAST(N'1989-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (142, N'6ejipC6dh8CGi2WiUACOvN', N'You Really Got Me', N'Van Halen', N'2cnMpRsOVqtPMfq7YiFE6K', N'https://p.scdn.co/mp3-preview/d5f854aa18004122880c68a2e4ae9e17f1aa72f4', N'Van Halen', N'7G2PY8yve3Db0PeGsosb4x', N'https://i.scdn.co/image/f4a825f4bf8ba56d4437e404bf46b9c8e98e982a', CAST(N'1978-02-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (143, N'24GaspdcJWLts2R1wurDfW', N'Eruption', N'Van Halen', N'2cnMpRsOVqtPMfq7YiFE6K', N'https://p.scdn.co/mp3-preview/166aa8882f7e71426c57a359f78c0b096083fde1', N'Van Halen', N'7G2PY8yve3Db0PeGsosb4x', N'https://i.scdn.co/image/f4a825f4bf8ba56d4437e404bf46b9c8e98e982a', CAST(N'1978-02-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (144, N'0LN0ASTtcGIbNTnjSHG6eO', N'Pour Some Sugar On Me (2012)', N'Def Leppard', N'6H1RjVyNruCmrBEWRbD0VZ', N'https://p.scdn.co/mp3-preview/f8ad90d3836a565655d5fe6e8ee76c7464edcba9', N'Pour Some Sugar On Me (2012)', N'5eJnzLcFCVt0Wcepaj6GiW', N'https://i.scdn.co/image/611db1f195b6580e228f6dfe2a75f59dff8905e1', CAST(N'1987-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (145, N'5p34sF7EskpzTuW3RGy9fs', N'Total Eclipse of the Heart', N'Bonnie Tyler', N'0SD4eZCN4Kr0wQk56hCdh2', N'https://p.scdn.co/mp3-preview/77918b8244d620545dd2409c13c08d4eb04fea7f', N'Faster Than The Speed Of Night', N'4bDeFxQb8zr1HDed1ElE1w', N'https://i.scdn.co/image/8df019cb6963044ec798f52f61822045e3204988', CAST(N'1983-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (146, N'6AJlcxjEO2baFC24GPsJjg', N'Holding Out for a Hero', N'Bonnie Tyler', N'0SD4eZCN4Kr0wQk56hCdh2', N'https://p.scdn.co/mp3-preview/9868dcb41284b09ab337f6f4bfa0fb6de2585849', N'Faster Than The Speed Of Night / Secret Dreams & Forbidden Fire', N'6Fo3XlFWNg54lLekR0IYtx', N'https://i.scdn.co/image/3c6b2bb93d744fd7113ac27ad1ae3d8026c1aa43', CAST(N'1986-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (147, N'2oUeXNq3vYqB60LB1D219g', N'Rockin'' All Over The World', N'Status Quo', N'4gIdjgLlvgEOz7MexDZzpM', N'https://p.scdn.co/mp3-preview/b942cedff0b00542084817980279c6955eb31bef', N'Rockin'' All Over The World', N'5hGgMAaSc2MUUnO4S5E32l', N'https://i.scdn.co/image/41ec9405ea73c2c49227b6db8d4670ac58e30b92', CAST(N'1977-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (148, N'6TPAhgpBvhMIDUzmDnWJmj', N'In The Army Now', N'Status Quo', N'4gIdjgLlvgEOz7MexDZzpM', N'https://p.scdn.co/mp3-preview/aa8c74df2514f7c20ed6b82d58f8c26e2bce5ea5', N'In The Army Now', N'2AkxtR1F8F0kf13A1kZ1lx', N'https://i.scdn.co/image/e439ca665dceb268c4668a84eb9101dd220edcdf', CAST(N'1986-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (149, N'0M5wW96q1hkvIlmuw131g9', N'Caroline', N'Status Quo', N'4gIdjgLlvgEOz7MexDZzpM', N'https://p.scdn.co/mp3-preview/7e9881cfbdfc9277b6a3b6a3a58ed813a7d414cf', N'Hello', N'5X2iAS1YMrrPU0mVQZJjCC', N'https://i.scdn.co/image/9c665649d8a73dcbb04f9ba3cc54f2c3741eb5ea', CAST(N'1973-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (150, N'5K8gqK84cFZV1dFJAMC0jU', N'Doctor Doctor - 2007 Remastered Version', N'UFO', N'2Omy3P5hFZym7FKum1JA1s', N'https://p.scdn.co/mp3-preview/2ce490893dfc57f166640a50c934b6db092b4cea', N'Phenomenon', N'21TBAv8TH57HEZOrAO8FaX', N'https://i.scdn.co/image/2eee77c4826bb8bb03547479f5c725e371883492', CAST(N'1974-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (151, N'6Z435tBPT5JamUR9dN7y8y', N'The Temple Of The King', N'Rainbow', N'6SLAMfhOi7UJI0fMztaK0m', N'https://p.scdn.co/mp3-preview/9b37142d95c8aba6bed75bb9a87b37beedc32d56', N'Ritchie Blackmore''s Rainbow (Remastered)', N'0RsJGRspEXnzwNMBAdrV3u', N'https://i.scdn.co/image/e108963008135b4a2154bf4af6156dda6ff60d82', CAST(N'1975-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (152, N'7ntdCok2CiwTmyiAh96N10', N'Since You Been Gone', N'Rainbow', N'6SLAMfhOi7UJI0fMztaK0m', N'https://p.scdn.co/mp3-preview/39cb5a17e1bbd31b4632bc5cb6c72c64d969519f', N'Finyl Vinyl', N'2vnQoE3YPOMZfFndnJFG8R', N'https://i.scdn.co/image/be93b459bb8e39c090c9b2eebb1673317a1c5afd', CAST(N'1986-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (153, N'567EwOGPAXg7Y9DQZTEFEE', N'Here I Go Again - 2011 Remastered Version', N'Whitesnake', N'3UbyYnvNIT5DFXU4WgiGpP', N'https://p.scdn.co/mp3-preview/584ead437205b2a97397820b04d18a3825d27268', N'Saint''s and Sinners [Remastered] (Remastered Version)', N'1WFozsJ1CQfkuGcd9GjYTX', N'https://i.scdn.co/image/aee08480edadc7c15696b05045d886146ddfd66f', CAST(N'1982-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (154, N'63ZUgNxorR2j1Au8iHBhDQ', N'Heartbreak Station', N'Cinderella', N'7HL4id2U7FSDJtfKQHMgQx', N'https://p.scdn.co/mp3-preview/e900f83ae98ab20b28e59514b39be5ae7646bdb3', N'Heartbreak Station', N'2fxpaT73zIgbKXNhVQDSER', N'https://i.scdn.co/image/8b1c21cb1d038895d103c45242b07d95fc75a5f3', CAST(N'1990-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (155, N'43eBgYRTmu5BJnCJDBU5Hb', N'Rio - 2009 Remastered Version', N'Duran Duran', N'0lZoBs4Pzo7R89JM9lxwoT', N'https://p.scdn.co/mp3-preview/892b5d7c500ad7e71e4b393cec14f5cdb241de4c', N'Rio [Collector''s Edition]', N'02tfQwJSOLP77oCd9U8bqm', N'https://i.scdn.co/image/81b9105a8c2bfcfad088b92f7a9351a640354159', CAST(N'1982-05-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (156, N'4EFkvOhgAmlHEfDfvfSoh5', N'Girls On Film - 2010 Remastered Version', N'Duran Duran', N'0lZoBs4Pzo7R89JM9lxwoT', N'https://p.scdn.co/mp3-preview/558aee3c4e431eba53b0e93b5fac5476c7fa3694', N'Duran Duran', N'2Tc7ILGF89w1PWOhzuZlqB', N'https://i.scdn.co/image/a073a32217b735b0f6180aa7ac7698327937694e', CAST(N'1981-06-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (157, N'5gMnyAfZHIZ2eC8lSTBPQI', N'You Spin Me Round (Like a Record)', N'Dead Or Alive', N'5WWSL6rElJeUk3Uc1S2RyD', N'https://p.scdn.co/mp3-preview/d006f5932ca952fef1aa3c9aa94ad894b07e64a7', N'Youthquake', N'6d5tBL8NLw1Jdhr8D2w3PF', N'https://i.scdn.co/image/eb9ddd4072d4b07f664d4491522a5e94f0088b2b', CAST(N'1985-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (158, N'1K3RzyzlBhMzOZtR0yepeb', N'Relax', N'Frankie Goes To Hollywood', N'1mZu3rO7qSD09GdDpePHhY', N'https://p.scdn.co/mp3-preview/26dd03eb353ec6d9dfa2ae3e84fbaac62cd8b314', N'Welcome To The Pleasuredome: 25th Anniversary Deluxe Edition', N'1RM3rN15A0HzbItaUZFrNU', N'https://i.scdn.co/image/eb13e7672a85191f3736607c433cfdb0826f5194', CAST(N'1984-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (159, N'3L7RtEcu1Hw3OXrpnthngx', N'Don''t You Want Me - 2002 - Remaster', N'The Human League', N'1aX2dmV8XoHYCOQRxjPESG', N'https://p.scdn.co/mp3-preview/d9ea24b609cd3688e102e30fb5f74885c21096e4', N'Dare!/Love And Dancing', N'0DhVjSKabBvhgTFPiRYy7F', N'https://i.scdn.co/image/343dddfcd4edbc0801fa68dbce191cef9ee82250', CAST(N'1981-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (160, N'6eTZyUjg4ZoGElNcAINIwJ', N'Tainted Love', N'Soft Cell', N'6aq8T2RcspxVOGgMrTzjWc', N'https://p.scdn.co/mp3-preview/39489a8b29babc90424b875071297b796a7b1086', N'Non-Stop Erotic Cabaret', N'3KFWViJ1wIHAdOVLFTVzjD', N'https://i.scdn.co/image/d477e0bc4a562b6281e82c3ce9fd37450fc7598a', CAST(N'1981-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (161, N'0LGIp29J62jAVkyr401Ytu', N'Dancing With Tears In My Eyes', N'Ultravox', N'3iUjRVvYCsMfz7tuAQtBDI', N'https://p.scdn.co/mp3-preview/e8d0b010bd1d10b252ca4edce66e4f68a461609b', N'Lament', N'0pYMm0v8KrDip73ij29gnk', N'https://i.scdn.co/image/b687d0d36203baeb0f26ddaf5ac196389df3db43', CAST(N'1984-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (162, N'7AmdLtDBBMHWTvneMLm8Nj', N'Vienna - 2008 Remastered Version', N'Ultravox', N'3iUjRVvYCsMfz7tuAQtBDI', N'https://p.scdn.co/mp3-preview/f5a27508a2c1ff9320a1d5c9400b87d0bf0e7296', N'Vienna', N'5H43Ao2FTCnu2LPuWgXPYQ', N'https://i.scdn.co/image/5494ba518be929172d55f97576ba2203ee6aec5f', CAST(N'1980-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (163, N'64B4UbGRLtGRBtiN2m8OvF', N'Love Shack [Edit] (45 Version)', N'The B-52''s', N'3gdbcIdNypBsYNu3iiCjtN', N'https://p.scdn.co/mp3-preview/c7d10ea5617dc406a516bff4e9dae7398d61941d', N'Love Shack [edit] / Channel Z [Digital 45]', N'4ugIloQYMfDhN7lOtEWezy', N'https://i.scdn.co/image/9db4171d84ca72afa7e41cd98d87719d9846e595', CAST(N'1989-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (164, N'4NH4xiPQ7TqNGqj6pZV4ki', N'Karma Chameleon', N'Culture Club', N'6kz53iCdBSqhQCZ21CoLcc', N'https://p.scdn.co/mp3-preview/593ab70d9b7a840ab4d56d482bba224e453b33fb', N'Colour By Numbers', N'0VgBqlPrvUQsOqSwzA0fET', N'https://i.scdn.co/image/6697af505d60ff2ff2ed722beedc77e9de861e5a', CAST(N'1983-10-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (165, N'0TF3F5Lw5apoD1zvR8LikO', N'Jessie''s Girl', N'Rick Springfield', N'6IFXsrXBpwbIqtOUOiAa3p', N'https://p.scdn.co/mp3-preview/3945d0175d1af1e030a9a819db31a7da133cf598', N'Working Class Dog', N'5MeeResNCJfmDmwmHX4w2D', N'https://i.scdn.co/image/7f8c05656331525f6d02cd4ca687527e4b2495dc', CAST(N'1981-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (166, N'2HXixVqzzm9rEUIMAWzshl', N'I Hate Myself for Loving You', N'Joan Jett', N'6ZRWxu4ak88m5yHBAEelkQ', N'https://p.scdn.co/mp3-preview/a7537e0fb30f8631f22c53eac5bf4cc8b5b29b87', N'Up Your Alley', N'2pkv3nrNrwtUdT8VNWwt5U', N'https://i.scdn.co/image/02a6eb77063c0009132fdded18d59d748d0eaa60', CAST(N'1988-05-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (167, N'1TfqLAPs4K3s2rJMoCokcS', N'Sweet Dreams (Are Made of This) - Remastered Version', N'Eurythmics', N'0NKDgy9j66h3DLnN8qu1bB', N'https://p.scdn.co/mp3-preview/a73b16c13483d0bd84d44c0a2f6c4d1313a4bd5e', N'Sweet Dreams (Are Made Of This)', N'5jNDWA19BJbE24x1UUJGRY', N'https://i.scdn.co/image/4c39e64e38049b2efa19c0b56a3c29b376871653', CAST(N'1983-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (168, N'2hbA72TFulrNGTEBUMAnzG', N'There Must Be An Angel (Playing With My Heart) - Remastered Version', N'Eurythmics', N'0NKDgy9j66h3DLnN8qu1bB', N'https://p.scdn.co/mp3-preview/c1f16d3e66e8a56bebc9bc6a3831391f6bc21cae', N'Be Yourself Tonight', N'2tbXCl8en5ZDVnHIk1OZGI', N'https://i.scdn.co/image/34a83886d67c0fa4c9b4b85fb831136eaf7f48c2', CAST(N'1985-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (169, N'7ba7mwoleFlwmOiuqw8XNf', N'Unskinny Bop - 2006 - Remaster', N'Poison', N'1fBCIkoPOPCDLUxGuWNvyo', N'https://p.scdn.co/mp3-preview/17fb9c4b88e3ce0624c9b2f03116618bda88ab86', N'Flesh & Blood', N'7alngtync76VqYWSKxcBhB', N'https://i.scdn.co/image/b7c8bfc0dc1155ceb5338bc640c31a4a6ed06d97', CAST(N'1990-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (170, N'1mdlNDjI26EaMUNA1Ti9Xy', N'Something to Believe In - 2003 - Remaster', N'Poison', N'1fBCIkoPOPCDLUxGuWNvyo', N'https://p.scdn.co/mp3-preview/02674e3ce2398716d905292d329c80d9320daaad', N'Flesh & Blood', N'7alngtync76VqYWSKxcBhB', N'https://i.scdn.co/image/b7c8bfc0dc1155ceb5338bc640c31a4a6ed06d97', CAST(N'1990-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (171, N'2xpWp44LowsqtKEilDZzln', N'Life Goes On - 2003 - Remaster', N'Poison', N'1fBCIkoPOPCDLUxGuWNvyo', N'https://p.scdn.co/mp3-preview/3d87447de286a5734485f49ed774c12de562aa63', N'Flesh & Blood', N'7alngtync76VqYWSKxcBhB', N'https://i.scdn.co/image/b7c8bfc0dc1155ceb5338bc640c31a4a6ed06d97', CAST(N'1990-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (172, N'6oWpGuwokWJ4EcWgVQPdUt', N'Summer Of ''69', N'Bryan Adams', N'3Z02hBLubJxuFJfhacLSDc', N'https://p.scdn.co/mp3-preview/0882fddeafc035303f809dae9eee37519f9688dc', N'Reckless', N'0dLBZmYzmQRZOz4cJG05DA', N'https://i.scdn.co/image/d5baee1c38afbe80be675abbf6f982625d650429', CAST(N'1984-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (173, N'5nydh0uIcz9gxSoJY6FtTn', N'(Everything I Do) I Do It For You', N'Bryan Adams', N'3Z02hBLubJxuFJfhacLSDc', N'https://p.scdn.co/mp3-preview/e502187fc2c7003565218dc103a424777bc2bd58', N'Waking Up The Neighbours', N'0RhmLffWf3oRr6ahOS6G47', N'https://i.scdn.co/image/b51faf7abd576f2af47cae5132fd21440b3b0f7b', CAST(N'1991-09-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (174, N'6jFOG89lRSnBD8QDExis0s', N'Run To You', N'Bryan Adams', N'3Z02hBLubJxuFJfhacLSDc', N'https://p.scdn.co/mp3-preview/8d827ac51f9fc51ee8a4b842c732d3e10c35c803', N'Reckless', N'0dLBZmYzmQRZOz4cJG05DA', N'https://i.scdn.co/image/d5baee1c38afbe80be675abbf6f982625d650429', CAST(N'1984-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (175, N'4f2QcB0RYGz70dXGjvpR0w', N'Barracuda', N'Heart', N'34jw2BbxjoYalTp8cJFCPv', N'https://p.scdn.co/mp3-preview/ece94d442e84355301658766a60eb580166b3b5d', N'Little Queen', N'1LaeNhiUpL3X6N0LcFvuDF', N'https://i.scdn.co/image/4263a2cfc5a34701d53326c505cd7a644c46e090', CAST(N'1977-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (176, N'7itr4N5bXkAWesPUomCNf7', N'Stranglehold', N'Ted Nugent', N'21ysNsPzHdqYN2fQ75ZswG', N'https://p.scdn.co/mp3-preview/520962f51fd9671ea0cfcfd1b900b0f89905e01f', N'Ted Nugent', N'0UwPjWzLZCx6tGNXfom6BV', N'https://i.scdn.co/image/9f260d0fbb98ba05f9bf0dba145ec675807edfaa', CAST(N'1975-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (177, N'0SvfyHYDp2uIsHt53LDlI9', N'Cat Scratch Fever', N'Ted Nugent', N'21ysNsPzHdqYN2fQ75ZswG', N'https://p.scdn.co/mp3-preview/9b8e1c7b529a78e6c57b622c41b268207a30c676', N'Cat Scratch Fever', N'7dnt5Qf46FPOI3wh4FZoxx', N'https://i.scdn.co/image/a1d5c0c08a746528fb8936d6e35cdecd4ccaf245', CAST(N'1977-02-26T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (178, N'0OBwxFLu6Yj61s2OagYbgY', N'Gimme All Your Lovin''', N'ZZ Top', N'2AM4ilv6UzW0uMRuqKtDgN', N'https://p.scdn.co/mp3-preview/61e0db81a499802dff53c19235ee82513a0e37cb', N'Eliminator', N'5LMGAYhn2ywaxGZdtmXGpw', N'https://i.scdn.co/image/832cbab41aa6239e672eb785f2ec3cbf788855ff', CAST(N'1983-03-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (179, N'6s0NHplywwr1IjnQpUpWJk', N'Bad To The Bone', N'George Thorogood And The Destroyers', N'4n31svBA9GGIYxGxgrQaRK', N'https://p.scdn.co/mp3-preview/8167d9d67b60304591479fe6730fe62bd6c7dcb3', N'BAD TO THE BONE', N'2YeoeDa3soxjD4ANZGG1fj', N'https://i.scdn.co/image/158cdbb48bd389eb85f59d3cc5a41e74fef85a15', CAST(N'1982-02-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (180, N'5tyHxEsVUFUsb1yzAObAxu', N'My Name Is Jonas', N'Weezer', N'3jOstUTkEu2JkjvRdBA5Gu', N'https://p.scdn.co/mp3-preview/f0ef4d7b668edcf06e987180faf60f062beb30e8', N'Weezer (Deluxe Edition)', N'0cK7vsvVwqgGaBLorT1g81', N'https://i.scdn.co/image/51e0817fe60ebc8bc1e30a43f73e59113b155edb', CAST(N'1994-05-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (181, N'2Rw3rN4jQim09uCj7kV1L5', N'Undone -- The Sweater Song', N'Weezer', N'3jOstUTkEu2JkjvRdBA5Gu', N'https://p.scdn.co/mp3-preview/cc85d81484828a3cb989e6d18d0cc9736f212718', N'Weezer (Deluxe Edition)', N'0cK7vsvVwqgGaBLorT1g81', N'https://i.scdn.co/image/51e0817fe60ebc8bc1e30a43f73e59113b155edb', CAST(N'1994-05-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (182, N'29xKs5BAHlmlX1u4gzQAbJ', N'Hash Pipe', N'Weezer', N'3jOstUTkEu2JkjvRdBA5Gu', N'https://p.scdn.co/mp3-preview/f0dc7114e2e5ec50cd3564b9e8b4dbc99a1bbcee', N'Weezer (Green Album)', N'2hDiTEsKePTnDcvKEuLizk', N'https://i.scdn.co/image/3ed01ee343c29dc1f5239f02f7266aae52cbf935', CAST(N'2001-05-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (183, N'3VEFybccRTeWSZRkJxDuNR', N'Peaches', N'The Presidents Of The United States Of America', N'1lZvg4fNAqHoj6I9N8naBM', N'https://p.scdn.co/mp3-preview/b42accc3b83f9ed832c106048738e8d22fd126db', N'The Presidents of The United States of America: Ten Year Super Bonus Special Anniversary Edition', N'5xxeAo8AVneH1OKO5vR604', N'https://i.scdn.co/image/a440ae5aa9ba1859134f1926042302d757b1f11f', CAST(N'1995-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (184, N'2JdzB67NvIa90K4gEZPLeX', N'Lump', N'The Presidents Of The United States Of America', N'1lZvg4fNAqHoj6I9N8naBM', N'https://p.scdn.co/mp3-preview/184da90340caa85a5c0bbbd25a5d3092a88c1d9e', N'The Presidents of The United States of America: Ten Year Super Bonus Special Anniversary Edition', N'5xxeAo8AVneH1OKO5vR604', N'https://i.scdn.co/image/a440ae5aa9ba1859134f1926042302d757b1f11f', CAST(N'1995-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (185, N'7bCKBqdYJI8fvFH48sT2IN', N'Dune Buggy', N'The Presidents Of The United States Of America', N'1lZvg4fNAqHoj6I9N8naBM', N'https://p.scdn.co/mp3-preview/c4764cf2f2a6d788162e0f8f45d8203972486c28', N'The Presidents of The United States of America: Ten Year Super Bonus Special Anniversary Edition', N'5xxeAo8AVneH1OKO5vR604', N'https://i.scdn.co/image/a440ae5aa9ba1859134f1926042302d757b1f11f', CAST(N'1995-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (186, N'37EJtTS7jT5WUyXGZzrwnI', N'Santa Monica', N'Everclear', N'694QW15WkebjcrWgQHzRYF', N'https://p.scdn.co/mp3-preview/4bc293b66c39267a41d90600f213b79530bc1e99', N'Sparkle And Fade', N'27qNa5ef0TpYV17dBY01U0', N'https://i.scdn.co/image/aeff5aa9a2fe4d542af932b7b5e1c17e461f4b52', CAST(N'1995-05-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (187, N'4vJr55lngvhSM8WIh9CjQc', N'Cemetery Gates', N'Pantera', N'14pVkFUHDL207LzLHtSA18', N'https://p.scdn.co/mp3-preview/e36a3d6075dc2c942fa606e8ef1bc1fa6b8afef4', N'Cowboys From Hell', N'5szY4sBOSD6IFjFN1RtWTe', N'https://i.scdn.co/image/d0d574f9a7ac9432ea471dca0afc88f7912747da', CAST(N'1990-07-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (188, N'6RVhP2FB2UNWZzs9aOOCB2', N'Jessica - Unedited Version', N'The Allman Brothers Band', N'4wQ3PyMz3WwJGI5uEqHUVR', N'https://p.scdn.co/mp3-preview/39576bc765edf0dbf76f476f0a2cf3eeba9c7b7c', N'Brothers And Sisters', N'4nORvGPPssCQikQQuS40bo', N'https://i.scdn.co/image/73389b2c6f9e3da10b10cdaeed62c84db43612d5', CAST(N'1973-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (189, N'6YEOmCsXSk9ZPE0FkcCiuQ', N'Layla', N'Eric Clapton', N'6PAt558ZEZl0DmdXlnjMgD', N'https://p.scdn.co/mp3-preview/d96ec976d64bc5aac048f6c16b53d6eeaece4260', N'Unplugged [Remastered]', N'4Q2d9ZNCUgAKywKUd28AWg', N'https://i.scdn.co/image/98b9cfbb35a1127482469267896ec747ab4798da', CAST(N'1992-08-25T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (190, N'2udGjDmpK1dH9VGyw7nrei', N'Cocaine', N'Eric Clapton', N'6PAt558ZEZl0DmdXlnjMgD', N'https://p.scdn.co/mp3-preview/180a53b0481d797b43bca4297180b53c174634fc', N'Slowhand 35th Anniversary (Super Deluxe)', N'5L3heXJfh1liiYsZyFZ22G', N'https://i.scdn.co/image/008c440c8b9a4bc7514e27470a235d7a9c1b9639', CAST(N'1977-11-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (191, N'7hxnlRuYmF1rU5WO6Obw8I', N'Bell Bottom Blues - 40th Anniversary / 2010 Remastered', N'Derek & The Dominos', N'2rc78XDH9zuJP6bm78lU8Z', N'https://p.scdn.co/mp3-preview/52cb12eeea1f58eeac83563ff68688556fae37d8', N'Layla And Other Assorted Love Songs (Super Deluxe Edition)', N'79u2ZsF3EcnpDO29gBfIQu', N'https://i.scdn.co/image/6b085cddf89179f4988ad857fd634a2f5e8f7b25', CAST(N'1970-11-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (192, N'2BcvvHttiZRvguFM4hR398', N'Sunshine Of Your Love', N'Cream', N'74oJ4qxwOZvX6oSsu1DGnw', N'https://p.scdn.co/mp3-preview/9edae7b21f19a53dbfdd1e026e6c1011976c1c6a', N'Disraeli Gears (Remastered)', N'4SMNUQCyTvlO4vFEdXXG45', N'https://i.scdn.co/image/1d6213ef34307b7cdc83e69ce15008f7a470d1ef', CAST(N'1967-11-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (193, N'5X76oXHcR5uCXali0gOyX5', N'White Room', N'Cream', N'74oJ4qxwOZvX6oSsu1DGnw', N'https://p.scdn.co/mp3-preview/e36329c908a258d43254d41a79f2515d372fade9', N'Wheels Of Fire (Remastered)', N'4M9csrFM1XVEpwMeYUBRmX', N'https://i.scdn.co/image/40344281e0f7478424978dd513a4a6827165fa2e', CAST(N'1968-07-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (194, N'2aoo2jlRnM3A0NyLQqMN2f', N'All Along the Watchtower', N'Jimi Hendrix', N'776Uo845nYHJpNaStv1Ds4', N'https://p.scdn.co/mp3-preview/f8c2e56b84eb61f92a13d34e7d801fbf24d0cc3f', N'Electric Ladyland', N'5z090LQztiqh13wYspQvKQ', N'https://i.scdn.co/image/e4f132327d986c8c482f59c1284098533c4ca732', CAST(N'1968-10-25T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (195, N'0wJoRiX5K5BxlqZTolB2LD', N'Purple Haze', N'Jimi Hendrix', N'776Uo845nYHJpNaStv1Ds4', N'https://p.scdn.co/mp3-preview/82e6ce4a6ee3de66b72079de519416d1dc5a4400', N'Are You Experienced', N'7rSZXXHHvIhF4yUFdaOCy9', N'https://i.scdn.co/image/332ecce39c8c1691d45dff32acc438c98bbccc6e', CAST(N'1967-05-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (196, N'0NWPxcsf5vdjdiFUI8NgkP', N'Hey Joe', N'Jimi Hendrix', N'776Uo845nYHJpNaStv1Ds4', N'https://p.scdn.co/mp3-preview/983c36bcd200f0f382e34f61fc38220f3e4ac35a', N'Are You Experienced', N'7rSZXXHHvIhF4yUFdaOCy9', N'https://i.scdn.co/image/332ecce39c8c1691d45dff32acc438c98bbccc6e', CAST(N'1967-05-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (197, N'23MrkN7g6Q5U7GLIxNHN1B', N'Foxey Lady', N'Jimi Hendrix', N'776Uo845nYHJpNaStv1Ds4', N'https://p.scdn.co/mp3-preview/2d2354b761a837980e3ebc97c1700d1a33c37f02', N'Are You Experienced', N'7rSZXXHHvIhF4yUFdaOCy9', N'https://i.scdn.co/image/332ecce39c8c1691d45dff32acc438c98bbccc6e', CAST(N'1967-05-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (198, N'3XxBSvDZKH5YvZZjTpn6eR', N'Red House', N'Jimi Hendrix', N'776Uo845nYHJpNaStv1Ds4', N'https://p.scdn.co/mp3-preview/dbaf4dcd2bad59e8a7fbed7001cf4fefb65936f4', N'Are You Experienced', N'7rSZXXHHvIhF4yUFdaOCy9', N'https://i.scdn.co/image/332ecce39c8c1691d45dff32acc438c98bbccc6e', CAST(N'1967-05-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (199, N'6ToM0uwxtPKo9CMpbPGYvM', N'Break On Through (To The Other Side)', N'The Doors', N'22WZ7M8sxp5THdruNY3gXt', N'https://p.scdn.co/mp3-preview/ad7679a47a21549aceccb0f422f6c6aa9b4a20a4', N'The Doors', N'1jWmEhn3ggaL6isoyLfwBn', N'https://i.scdn.co/image/c9a1e721b6c5426dffb9af741e29191d3809133f', CAST(N'1967-01-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (200, N'5uvosCdMlFdTXhoazkTI5R', N'Light My Fire', N'The Doors', N'22WZ7M8sxp5THdruNY3gXt', N'https://p.scdn.co/mp3-preview/6bb473ae5662bfd307139f10a4d9d6efbce1e45d', N'The Doors', N'1jWmEhn3ggaL6isoyLfwBn', N'https://i.scdn.co/image/c9a1e721b6c5426dffb9af741e29191d3809133f', CAST(N'1967-01-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (201, N'5UgT7w6zVZjP3oyawMzbiK', N'The End', N'The Doors', N'22WZ7M8sxp5THdruNY3gXt', N'https://p.scdn.co/mp3-preview/967b32f09234d0f144811497cb5e5342c5d9a8f3', N'The Doors', N'1jWmEhn3ggaL6isoyLfwBn', N'https://i.scdn.co/image/c9a1e721b6c5426dffb9af741e29191d3809133f', CAST(N'1967-01-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (202, N'1Q5kgpp4pmyGqPwNBzkSrw', N'Roadhouse Blues', N'The Doors', N'22WZ7M8sxp5THdruNY3gXt', N'https://p.scdn.co/mp3-preview/35da82eca361b500537b9e5e2b5d5d0f5ae6e6d2', N'Morrison Hotel', N'6AFLOkpJjFF652jevcSOZX', N'https://i.scdn.co/image/841ae550aeaa28ebbd7f25ce3e1291489b1d3345', CAST(N'1970-02-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (208, N'0n2SEXB2qoRQg171q7XqeW', N'Smooth', N'Santana', N'6GI52t8N5F02MxU0g5U69P', N'https://p.scdn.co/mp3-preview/50e8d558d5a75301bdd23d2b814e60615b1aeb59', N'Supernatural (Remastered)', N'10aiDpdFGyfCFEcqpx6XTq', N'https://i.scdn.co/image/a227a6a25d9f581b9b88a2f063def3104e2da8e9', CAST(N'1999-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (210, N'4abPGwvqR26EVyXJI72VRP', N'Layla', N'Eric Clapton', N'6PAt558ZEZl0DmdXlnjMgD', N'https://p.scdn.co/mp3-preview/d96ec976d64bc5aac048f6c16b53d6eeaece4260', N'Unplugged [Remastered]', N'4Q2d9ZNCUgAKywKUd28AWg', N'https://i.scdn.co/image/98b9cfbb35a1127482469267896ec747ab4798da', CAST(N'1992-08-25T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (212, N'0dDjBeUnkgwFJIym4rhhR2', N'Down On The Farm', N'Seasick Steve', N'6OVkHZQP8QoBYqr1ejCGDv', N'https://p.scdn.co/mp3-preview/5aebd998451beafa6c1165ed5e2aced4a8f6c563', N'Hubcap Music', N'2M9xzSsGMgTr2kVjlkbpBT', N'https://i.scdn.co/image/2caefbeac5e3711e69475cf3aed9339f1ae6891e', CAST(N'2013-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (213, N'0bVtevEgtDIeRjCJbK3Lmv', N'Welcome To The Jungle', N'Guns N'' Roses', N'3qm84nBOXUEQ2vnTfUTTFC', N'https://p.scdn.co/mp3-preview/fce123cfaaf622d4936f6b064857f3f13b25203b', N'Appetite For Destruction', N'3I9Z1nDCL4E0cP62flcbI5', N'https://i.scdn.co/image/d9503afbbd8f9a2580ff0bcc3437bf7b68fc016c', CAST(N'1987-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (214, N'04MNKrAnzrHDUzuXAtNoLr', N'Live And Let Die', N'Guns N'' Roses', N'3qm84nBOXUEQ2vnTfUTTFC', N'https://p.scdn.co/mp3-preview/771ced95ae12a68dde217c8c53e465d244131573', N'Use Your Illusion I', N'4L5pz06MVlsWaTEjSQPN8h', N'https://i.scdn.co/image/6482585994240cbb5d27edc1d1560ef205e30940', CAST(N'1991-09-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (215, N'6DzuDDN9q4N29QXWDuQ8sx', N'Cats In The Cradle', N'Ugly Kid Joe', N'3XsgWn63EnA4wYZBjVyxjf', N'https://p.scdn.co/mp3-preview/39e97d8eb7915abb304ae824c084f2ed613000fc', N'America''s Least Wanted', N'3uN1oiR3KIuj642PscLiAQ', N'https://i.scdn.co/image/409f53de409b59680e218c326125a1105371fb7d', CAST(N'1992-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (216, N'0l37J5l4eJfIdd7cea1Cl5', N'Everything About You', N'Ugly Kid Joe', N'3XsgWn63EnA4wYZBjVyxjf', N'https://p.scdn.co/mp3-preview/d68be79778d28a88d9f2e7dc34e22b005c20abf7', N'America''s Least Wanted', N'3uN1oiR3KIuj642PscLiAQ', N'https://i.scdn.co/image/409f53de409b59680e218c326125a1105371fb7d', CAST(N'1992-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (217, N'3O0ZuqmDLb6ph2PVg6SAKW', N'Disco 2000', N'Pulp', N'36E7oYfz3LLRto6l2WmDcD', N'https://p.scdn.co/mp3-preview/9d1fd19372214667de2e17a468ccc94190c54edb', N'Different Class', N'2buT9KOxv0C805HkEUIQtu', N'https://i.scdn.co/image/6088dad0de7a46c62257aeb6568c7c5ffe67a192', CAST(N'1995-09-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (218, N'3B9VueMM1VPiOkW56KSRrB', N'Blueberry Hill - Non Stop Edit', N'Fats Domino', N'09C0xjtosNAIXP36wTnWxd', N'https://p.scdn.co/mp3-preview/5b6f88acb90a4e44192674132bf88de6955c9610', N'Legends Of Rock n'' Roll', N'4b9RizMvXeRHO3ZihUfas6', N'https://i.scdn.co/image/39c84c0f908e2272ac5073ca4db7228b9ede4117', CAST(N'1962-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (219, N'2aEeghgUcnu75tzcolFMfs', N'La Bamba', N'Ritchie Valens', N'5Y9xEAGW4GwGJgbiI6W85P', N'https://p.scdn.co/mp3-preview/5c7eee337e0bceadc477634e04e95bc875726193', N'Ritchie Valens', N'77UI8F1LuhiQaKIL1qOE1W', N'https://i.scdn.co/image/d923a559803717e0d7b60f89e11f9623db529033', CAST(N'1959-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (220, N'3TYiUYbVAfTM9GnCcBf8Um', N'Rave On', N'Buddy Holly', N'3wYyutjgII8LJVVOLrGI0D', N'https://p.scdn.co/mp3-preview/b0db25ab696beb5234e11fca8dc2c7b49bf5c994', N'Buddy Holly', N'5XWRJhJ3Uc5ndutOMtjSkf', N'https://i.scdn.co/image/dd047a4dd147eedad2e10a5a4c9ec27d2a69d776', CAST(N'1958-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (221, N'6qfIne1xNg5GDcmg73x0N8', N'Everyday', N'Buddy Holly', N'3wYyutjgII8LJVVOLrGI0D', N'https://p.scdn.co/mp3-preview/b2bb48639f64f15ff48bd3d2b154e5e66f20aff6', N'Buddy Holly', N'5XWRJhJ3Uc5ndutOMtjSkf', N'https://i.scdn.co/image/dd047a4dd147eedad2e10a5a4c9ec27d2a69d776', CAST(N'1958-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (222, N'6MIC4Z7pSY5oKLmgzdyK1z', N'That''ll Be The Day', N'Buddy Holly', N'3wYyutjgII8LJVVOLrGI0D', N'https://p.scdn.co/mp3-preview/0c822e09a75905ece102203757daffd497d50072', N'20 Golden Greats: Buddy Holly Lives', N'3oU3OPTKI0JfsVunkeODJE', N'https://i.scdn.co/image/3376e12d98bb5ed8b93d2cdc32be8e198a8cb521', CAST(N'1974-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (223, N'48i055G1OT5KxGGftwFxWy', N'Oh, Pretty Woman', N'Roy Orbison', N'0JDkhL4rjiPNEp92jAgJnS', N'https://p.scdn.co/mp3-preview/66d4d61af48f85a823440d91badf92be5ba50036', N'Oh, Pretty Woman', N'2jTbcSPVTBRAoc3mHU6hy0', N'https://i.scdn.co/image/50506bc01038ae5458b81be132dfeacfafe91de2', CAST(N'1966-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (224, N'0FoYHGrCnI8zF4utpPiHWx', N'I Drove All Night', N'Roy Orbison', N'0JDkhL4rjiPNEp92jAgJnS', N'https://p.scdn.co/mp3-preview/68b7adbe1fd52fd527a6b5e872ce92bf628456af', N'King Of Hearts', N'16wudyCi6qUSglfotL4TGI', N'https://i.scdn.co/image/988a3431856a9537708f5caa27b097a538c04427', CAST(N'1992-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (226, N'6DSvUZQdqtNfkJI4cAiUsM', N'The Twist', N'Chubby Checker', N'7qQJQ3YtcGlqaLg5tcypN2', N'https://p.scdn.co/mp3-preview/92c69eea52b707cfc6562958e5d464fdf29a83e5', N'Chubby Checker Classics', N'36tc0l1brbD9CCaUDrvqVi', N'https://i.scdn.co/image/34719293f15a9f49bafa4fe818a742e8e47b0f50', CAST(N'1962-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (228, N'310epXrlbXmfGcD1qSdgVV', N'Born in the U.S.A.', N'Bruce Springsteen', N'3eqjTLE0HfPfh78zjh6TqT', N'https://p.scdn.co/mp3-preview/b8318c15c0699e5e71da60f32f7f731dbea8717a', N'Born In The U.S.A.', N'14IYDXybb1XKu51QHDryak', N'https://i.scdn.co/image/24c87785f6e3371c8b79a943442e669135e40db2', CAST(N'1984-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (229, N'7j33vQkg76nP0TzzfoolXg', N'Im On Fire', N'Head Like a Hole (HLAH)', N'6hWjM6lqBKjzyHVilWAJey', N'https://p.scdn.co/mp3-preview/41f5bd6278c3997f283f2dc80432daf317fedad0', N'Blood On The Hony Tonk Floor, Best Of', N'6jZe5gLsfRZL49IuMsDIrf', N'https://i.scdn.co/image/fb7106558a2958ed6be935f9b5ea6e6beb1121f6', CAST(N'2000-10-26T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (230, N'6h4ApkdXMPF699JAY1LkVS', N'Larger Than Life [Sin Sing Studio Mix]', N'the feelers', N'5Wp28Tq1Ml2kj1kUF5CN0n', N'https://p.scdn.co/mp3-preview/1b3a44a9bed64fdb8946f7e3b6e497a15e3c1c71', N'playground battle [special edition]', N'7M8i3mY25SCGvZXxPeV71H', N'https://i.scdn.co/image/0ccc30abeff1b9148bb94c8addd8c7aea71dbe19', CAST(N'2003-11-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (231, N'7gfO970gk60AhrXA2TmDad', N'Fast Times in Tahoe', N'Elemeno P', N'5kDPuvM5kIV3tqpsppoUfB', N'https://p.scdn.co/mp3-preview/61be09b600fe9ba5bb44734a463b141d97a5e64e', N'Love & Disrespect (Limited Edition)', N'4B29Jsd5AQURUg6NufCyN8', N'https://i.scdn.co/image/96824770f7110ab2e0d029cb5d493565494847d7', CAST(N'2003-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (232, N'60zZFaec4f4TlWECYh002L', N'Verona', N'Elemeno P', N'5kDPuvM5kIV3tqpsppoUfB', N'https://p.scdn.co/mp3-preview/dc0ee7737eb426a56f4fc3790aaea08ddbea1457', N'Love & Disrespect (Limited Edition)', N'4B29Jsd5AQURUg6NufCyN8', N'https://i.scdn.co/image/96824770f7110ab2e0d029cb5d493565494847d7', CAST(N'2003-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (233, N'4Ud87Zsx32FeLrFUc6vEt9', N'11:57', N'Elemeno P', N'5kDPuvM5kIV3tqpsppoUfB', N'https://p.scdn.co/mp3-preview/877a980913f61fa7a0743ebf22dd86287fbc2400', N'Trouble In Paradise', N'15mhiZnqZqtRrY3wtOYcId', N'https://i.scdn.co/image/9680809b33da6cdd8675ae2ae252328931217e17', CAST(N'2005-10-24T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (236, N'5ZMftP47riIvJzVgdEirjL', N'Anchor Me', N'The Mutton Birds', N'0ZgEPpx6QzKn7abvMEHsdc', N'https://p.scdn.co/mp3-preview/3ed64950dd06eb91a5ad2bf77444d3394ca9cefd', N'Salty', N'6Nq55n54Wsy0Nm39qwMf42', N'https://i.scdn.co/image/dfbb958639686a4e59f38b16a994e844ea8567a9', CAST(N'1994-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (237, N'4WqHM9bVa6kMxRE66stmmH', N'Dominion Road', N'The Mutton Birds', N'0ZgEPpx6QzKn7abvMEHsdc', N'https://p.scdn.co/mp3-preview/47f07e5bbc3203ee453c3e6c97a4195d61030d36', N'The Mutton Birds', N'7FDhtUdrzZzYvdLs1crgIl', N'https://i.scdn.co/image/642602afc2bd2edd18a1c0d45f16545f16af20fc', CAST(N'1992-08-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (238, N'1hnrMwnGtXIosKpFWAImeV', N'Harmonic Generator', N'The Datsuns', N'2P6KPAphDMASmfHjnxSMmR', N'https://p.scdn.co/mp3-preview/615a472a2b89ce7c975b9e54676f3e03a54ca888', N'The Datsuns', N'5puLYwRqSbFVMjNCleCUiB', N'https://i.scdn.co/image/2bed87d72ad87c4c52387fd12ba06c5f9647f3cd', CAST(N'2002-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (239, N'2b9lp5A6CqSzwOrBfAFhof', N'Crazy Train - Remastered', N'Ozzy Osbourne', N'6ZLTlhejhndI4Rh53vYhrY', N'https://p.scdn.co/mp3-preview/70378c21e54412569ff77529226705e93416d33c', N'Blizzard of Ozz (Expanded Edition)', N'6aGfK3YpRxZ1rJfaNRckLH', N'https://i.scdn.co/image/4d697a9611c9fc0cd0fd16371ec80704faeedcc4', CAST(N'1980-09-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (240, N'0S3gpZzlT9Hb7CCSV2owX7', N'Mama, I''m Coming Home', N'Ozzy Osbourne', N'6ZLTlhejhndI4Rh53vYhrY', N'https://p.scdn.co/mp3-preview/b0076437adc18b6d9ef81a02aa0890722324e965', N'No More Tears (Bonus Track Version)', N'6eh82ojicL8RSJF7GkYTh7', N'https://i.scdn.co/image/6c3292ac6db0f9384927e5060e93af1eca489c41', CAST(N'1991-09-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (241, N'5XfWzGa5zuz88IOYbWNTMa', N'Mr. Crowley', N'Ozzy Osbourne', N'6ZLTlhejhndI4Rh53vYhrY', N'https://p.scdn.co/mp3-preview/42da001e2f3b7a32b370418207b41aa321230600', N'Blizzard of Ozz (Expanded Edition)', N'6aGfK3YpRxZ1rJfaNRckLH', N'https://i.scdn.co/image/4d697a9611c9fc0cd0fd16371ec80704faeedcc4', CAST(N'1980-09-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (244, N'7GtdbucESxLrec2lslRLEa', N'Backstreet Symphony', N'Thunder', N'3SfrwwVPGtjYTI3vwQ4hEU', N'https://p.scdn.co/mp3-preview/a4d9e5462228f176abaec3a57157a17575851e37', N'Backstreet Symphony', N'2bPj257oLDCgCyDvPRGSvG', N'https://i.scdn.co/image/149dbe6438f2f81ef1b16dcc7c7fddc98be3a736', CAST(N'1990-02-26T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (245, N'7JFysVNd8IeMpKLt4SEjN4', N'God Gave Rock ''N'' Roll To You II', N'KISS', N'07XSN3sPlIlB2L2XNcTwJw', N'https://p.scdn.co/mp3-preview/e531bf898df3e7f18145d8ae8fbb77d414f19233', N'Revenge', N'1R9CcOLvDk0DSdTVPv9KLE', N'https://i.scdn.co/image/b95b29049ef47a21f477554078394661200017db', CAST(N'1992-05-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (246, N'2miAut6dp9BWdGmOxwSGEC', N'Sweet Dreams (Are Made Of This)', N'Marilyn Manson', N'2VYQTNDsvvKN9wmU5W7xpj', N'https://p.scdn.co/mp3-preview/019d7e3736f0d6ba69928fa21153c20824727a1b', N'Smells Like Children', N'6V8b6itvyd7N3IRMXkjSi7', N'https://i.scdn.co/image/da7915574a966e7f6ca3263f1e77d90963956562', CAST(N'1995-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (247, N'5PjJxigUDDDrBhGO2FZ5sV', N'Psycho', N'Muse', N'12Chz98pHFMPJEknJQMWvI', N'', N'', N'', N'https://i.scdn.co/image/1e7a003dc5b92d6240347ae847db57e816aa9234', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (248, N'0BB9eUBBaaX6GALSYNcEp7', N'You Spin Me Round (Like a Record) - 7" Mix', N'Dead Or Alive', N'5WWSL6rElJeUk3Uc1S2RyD', N'https://p.scdn.co/mp3-preview/b1a741a8c75c2e7d709611e322871e845fac0a31', N'Youthquake', N'0HEKWtu7St3tKgZDKZsX90', N'https://i.scdn.co/image/16417b4ae192a85e1f7572ad5031d28834e5c50c', CAST(N'1985-09-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (249, N'2BPfKiV9U0CR1dpUgeUwuH', N'She Drives Me Crazy', N'Fine Young Cannibals', N'20p5D2KrE8CGuOjHtxsyTp', N'https://p.scdn.co/mp3-preview/c4d18b968378f85aba8baee27ba3734343dd54e1', N'The Raw And The Cooked', N'59R6wpHlRk6Ui19e7qAgo1', N'https://i.scdn.co/image/dc5a5773e3414db827ff46f4a98064bf914fabe0', CAST(N'1988-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (250, N'2mHs6wQRQ5slNOZ7SwFiHP', N'Johnny Come Home', N'Fine Young Cannibals', N'20p5D2KrE8CGuOjHtxsyTp', N'https://p.scdn.co/mp3-preview/89de66d2f838c3c7e1ad19c0a33ce8f5eafdb1f3', N'Fine Young Cannibals', N'6oIDyxG9umCrD5HlWtQ5c2', N'https://i.scdn.co/image/dea6671271d3c56630830fe56863ac62abcda86b', CAST(N'1985-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (253, N'6ZKlm17z22OxkzgemE4aos', N'Addicted To Love', N'Robert Palmer', N'530Sdm7eqqzWBdDmILMgnu', N'https://p.scdn.co/mp3-preview/b60055db5dbb20fd5dbf79f840a53790aac7dbc8', N'Riptide', N'7mejSpGldlXbaf2ewjeC5Q', N'https://i.scdn.co/image/86eff2747a48e7114f563712d39264b430692718', CAST(N'1985-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (254, N'2olVm1lHicpveMAo4AUDRB', N'The Power Of Love - 2006 Digital Remaster', N'Huey Lewis & The News', N'7A9yZMTrFZcgEWAX2kBfK6', N'https://p.scdn.co/mp3-preview/da5effaa3c99b59e3bdc077b8f3d46a820bc8722', N'Greatest Hits: Huey Lewis And The News', N'0u34k1ANjgZ47uQfG9yaLj', N'https://i.scdn.co/image/2336b27dad2b7829fea8331b30f7ccc2f3acae1c', CAST(N'2006-05-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (255, N'5MKmykXnrQEhvcD4B2rrdR', N'I''m In Love With My Car - Remastered 2011', N'Queen', N'1dfeR4HaWDbWqFHLkxsg1d', N'https://p.scdn.co/mp3-preview/18fbc255e3f0861a37b8f789df5868f2d5c75d9e', N'A Night At The Opera (2011 Remaster)', N'1TSZDcvlPtAnekTaItI3qO', N'https://i.scdn.co/image/05e237f63c31eb4941753e5fb171e31cfca6a877', CAST(N'1975-11-21T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (257, N'3W4AjgtJvG19wAvH27xDGb', N'Gimme Back My Dog', N'Slobberbone', N'5U1pEBuiFLycsQ4mYP3nmK', N'https://p.scdn.co/mp3-preview/00d8c313a5746cfc7723e8658d4f259fc286c00f', N'Everything You Thought Was Right Was Wrong Today', N'3x32Mg1TXhUPXrpu15CFLB', N'https://i.scdn.co/image/a4615ea19ac0d183aefa69631f0586387dd32906', CAST(N'2000-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (258, N'1med9ijNdCwxnyS8vBpfhR', N'Hurt', N'Johnny Cash', N'6kACVPfCOnqzgfEF5ryl0x', N'https://p.scdn.co/mp3-preview/7c8f349ae2b60bc4494366793e96d742817933f9', N'American IV: The Man Comes Around', N'17k01Y7uKSVOrnyEZPOqKR', N'https://i.scdn.co/image/741e67159be990445200f821c702f893cf52215e', CAST(N'2002-10-29T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (259, N'6fNg0XJSCq1Dn8GEtoDxbB', N'Patio Song', N'Gorky''s Zygotic Mynci', N'5ShFRZUGJZL1qMkIPtYV5M', N'https://p.scdn.co/mp3-preview/d596bd89900a650a8b247c084620e1bb912e26dc', N'Barafundle', N'4gPAbPEWrnz3KmSvJJBS1f', N'https://i.scdn.co/image/74f9c555926d404babdb0682e8d55f52ef38d0a8', CAST(N'1997-03-26T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (262, N'7eRAk2pnZDWhAiMmUdAOlb', N'MMMBop', N'Hanson', N'0SdiiPkr02EUdekHZJkt58', N'https://p.scdn.co/mp3-preview/bd3190d703561ed6368c30447535d1129f8c9a6c', N'Middle Of Nowhere', N'19ESjdea1cgcR2Lo0qc6Xu', N'https://i.scdn.co/image/9044156765f16e6d0850e97fbf1bb60709b27a1c', CAST(N'1997-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (264, N'2FvP0JM1amEXXNlcBUr37C', N'Achy Breaky Heart', N'Billy Ray Cyrus', N'60rpJ9SgigSd16DOAG7GSa', N'https://p.scdn.co/mp3-preview/40e7452d07a76ab86973effcaeb1e79ec7638a25', N'Some Gave All', N'2zogcp4VrnS3aTKPZZAyKf', N'https://i.scdn.co/image/25d1b423d92fb227ca4ef6a119897fe2e89f34f0', CAST(N'1992-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (265, N'3v7Hpshu7Lppgw8kSsy5ly', N'Livin'' On A Prayer', N'Bon Jovi', N'58lV9VcRSjABbAbfWS6skp', N'https://p.scdn.co/mp3-preview/a049f3a23771879bdb5aa353631754e9d1eda9f4', N'Slippery When Wet (Remastered)', N'7pMFJnQzOnQXviU4FPpQAn', N'https://i.scdn.co/image/c144a8be667868739daffb9b03b419cbf23ed922', CAST(N'1986-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (266, N'5VVwwfK6Cp9IydkhKfJUEq', N'You Give Love A Bad Name', N'Bon Jovi', N'58lV9VcRSjABbAbfWS6skp', N'https://p.scdn.co/mp3-preview/faa801a0784f1caf8b8f346df1ecde952c279b32', N'Slippery When Wet (Remastered)', N'7pMFJnQzOnQXviU4FPpQAn', N'https://i.scdn.co/image/c144a8be667868739daffb9b03b419cbf23ed922', CAST(N'1986-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (267, N'0whc72kLlbhR5QMmj9XPnb', N'Wanted Dead Or Alive', N'Bon Jovi', N'58lV9VcRSjABbAbfWS6skp', N'https://p.scdn.co/mp3-preview/0791447280c34cc87f38dd030beb4cdf1b27c1aa', N'Slippery When Wet (Remastered)', N'7pMFJnQzOnQXviU4FPpQAn', N'https://i.scdn.co/image/c144a8be667868739daffb9b03b419cbf23ed922', CAST(N'1986-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (268, N'5Ac8sOEk91RTzD06ViNzqf', N'Bed Of Roses', N'Bon Jovi', N'58lV9VcRSjABbAbfWS6skp', N'https://p.scdn.co/mp3-preview/8146697239cba7216bb733af74ad2aa624c7bee0', N'Keep The Faith (Remastered)', N'7LE04w5XSg8wIpIubDkqZr', N'https://i.scdn.co/image/53c45966e87cf21bed05e02d99b7642bc6df1368', CAST(N'1992-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (269, N'0odIT9B9BvOCnXfS0e4lB5', N'Bette Davis Eyes', N'Kim Carnes', N'5PN2aHIvLEM98XIorsPMhE', N'https://p.scdn.co/mp3-preview/14678dafc4c316a60b7d1a3c21c641572fdd079e', N'Mistaken Identity', N'3iMwQk5yE0UDDKbLCdcxZA', N'https://i.scdn.co/image/48c2fd9aed1c320b445a068a12e31303c735c697', CAST(N'1981-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (270, N'7fSGbZLhWlAiCC3HDPAULu', N'(I Can''t Get No) Satisfaction - Mono Version', N'The Rolling Stones', N'22bE4uQ6baNwSHPVcDxLCe', N'https://p.scdn.co/mp3-preview/9118af966f05ad48a57a04b46ff5d47c5f2de241', N'Out Of Our Heads (Remastered)', N'24V2ghp7XhGZzWKjthHq4v', N'https://i.scdn.co/image/c81f3880270e667986393ece2d2e2d42057742f6', CAST(N'1965-07-30T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (271, N'6oD0TvHIYmObKNl5Mz05ri', N'Angie - 2009 Re-Mastered Digital Version', N'The Rolling Stones', N'22bE4uQ6baNwSHPVcDxLCe', N'https://p.scdn.co/mp3-preview/abad397f0d77a1caea977e974179526d909246c5', N'Goats Head Soup (2009 Re-Mastered)', N'00ZkRCzSTS6jwUJLpaTWcj', N'https://i.scdn.co/image/fd005e7da99a67c3418a7fb4850b1d37e93d8c02', CAST(N'1973-08-31T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (272, N'0wzABO1igQsSy8cQ7dIeHK', N'Paint It Black', N'The Rolling Stones', N'22bE4uQ6baNwSHPVcDxLCe', N'https://p.scdn.co/mp3-preview/2d0418f7c49a79f576b1e11a5197fc7c213064c8', N'Aftermath (Remastered)', N'19MOC02Ei3l2SalGUGWozw', N'https://i.scdn.co/image/7e14f410ac12d72ac554349b29cb6ad1504bd3c0', CAST(N'1966-04-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (273, N'6l8EbYRtQMgKOyc1gcDHF9', N'Bridge over Troubled Water', N'Simon & Garfunkel', N'70cRZdQywnSFp9pnc2WTCE', N'https://p.scdn.co/mp3-preview/c93b13e994d7cf4b4e4a46328d6e881630c14603', N'Bridge Over Troubled Water', N'0JwHz5SSvpYWuuCNbtYZoV', N'https://i.scdn.co/image/dc906713d5a2f7bd8317b7fccfad9044cde6a602', CAST(N'1970-01-26T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (274, N'1eN42Q7IWRzRBq8eW2Y2TE', N'El Condor Pasa / If I Could', N'Simon & Garfunkel', N'70cRZdQywnSFp9pnc2WTCE', N'https://p.scdn.co/mp3-preview/ab63fb14756fea96586a2b0a63c8443e454fc2c9', N'Bridge Over Troubled Water', N'0JwHz5SSvpYWuuCNbtYZoV', N'https://i.scdn.co/image/dc906713d5a2f7bd8317b7fccfad9044cde6a602', CAST(N'1970-01-26T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (275, N'6QhXQOpyYvbpdbyjgAqKdY', N'Cecilia', N'Simon & Garfunkel', N'70cRZdQywnSFp9pnc2WTCE', N'https://p.scdn.co/mp3-preview/9e62f5828e97c7649958df89af0ae388753fed0e', N'Bridge Over Troubled Water', N'0JwHz5SSvpYWuuCNbtYZoV', N'https://i.scdn.co/image/dc906713d5a2f7bd8317b7fccfad9044cde6a602', CAST(N'1970-01-26T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (276, N'4uIjNF84ZbteunNMxr4Xc0', N'Keep the Customer Satisfied', N'Simon & Garfunkel', N'70cRZdQywnSFp9pnc2WTCE', N'https://p.scdn.co/mp3-preview/93d1e5324409fdb8b72821925d8941f30b1c541b', N'Bridge Over Troubled Water', N'0JwHz5SSvpYWuuCNbtYZoV', N'https://i.scdn.co/image/dc906713d5a2f7bd8317b7fccfad9044cde6a602', CAST(N'1970-01-26T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (277, N'76TZCvJ8GitQ2FA1q5dKu0', N'The Boxer', N'Simon & Garfunkel', N'70cRZdQywnSFp9pnc2WTCE', N'https://p.scdn.co/mp3-preview/599747de0139392f03184b21f42d4349517974d3', N'Bridge Over Troubled Water', N'0JwHz5SSvpYWuuCNbtYZoV', N'https://i.scdn.co/image/dc906713d5a2f7bd8317b7fccfad9044cde6a602', CAST(N'1970-01-26T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (279, N'61ZVP6ytLwYnbLonbJtzR6', N'The Ballroom Blitz', N'Sweet', N'3JaAGmSTpJK35DqWrDUzBz', N'https://p.scdn.co/mp3-preview/212271b86dcaadd9061b785c4d1d53695fdafa85', N'Sweet Best', N'710mrF7sQJjTraiDVjVE49', N'https://i.scdn.co/image/654d5f75c0845ff6bf6bca63ba02d7445db8ef92', CAST(N'1976-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (280, N'1PJu7IPmGJZx5fAQeL4trB', N'Wig Wam Bam', N'Sweet', N'3JaAGmSTpJK35DqWrDUzBz', N'https://p.scdn.co/mp3-preview/5ccb23bc3e0c743d27e46e5e367e24b26e909ae2', N'Sweet Best', N'710mrF7sQJjTraiDVjVE49', N'https://i.scdn.co/image/654d5f75c0845ff6bf6bca63ba02d7445db8ef92', CAST(N'1976-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (281, N'1NrrxP9dXEAgPmb2UQEXOJ', N'All the Young Dudes', N'Mott The Hoople', N'6ysQi6NI88X627t2srsWz6', N'https://p.scdn.co/mp3-preview/feb95b82ba47a3f1d15272ead2f5b0efd5f3aa35', N'All the young dudes', N'2aOWMZo9zarFg3wIPLdTA7', N'https://i.scdn.co/image/a270c59c3af3ab1b4eb9f731d6c3c622a6c72dcf', CAST(N'1972-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (282, N'01iyCAUm8EvOFqVWYJ3dVX', N'Dancing Queen', N'ABBA', N'0LcJLqbBmaGUft1e9Mm8HV', N'https://p.scdn.co/mp3-preview/e23b6569e50581403d754216c9891423e0ec880e', N'Arrival', N'79ZX48114T8NH36MnOTtl7', N'https://i.scdn.co/image/c77cc67a983a67a1f6eff3f404a81246d73a4810', CAST(N'1976-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (283, N'5ztQHTm1YQqcTkQmgDEU4n', N'Mamma Mia', N'ABBA', N'0LcJLqbBmaGUft1e9Mm8HV', N'https://p.scdn.co/mp3-preview/aa652931ae754ba60d73d02d2c43e3b372c3c775', N'Abba', N'5zT1JLIj9E57p3e1rFm9Uq', N'https://i.scdn.co/image/ba736c1d88cadc797714b850136ae19bc43c1947', CAST(N'1975-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (284, N'5kBZR12AntJUTo9UeAsKqP', N'The Winner Takes It All', N'ABBA', N'0LcJLqbBmaGUft1e9Mm8HV', N'https://p.scdn.co/mp3-preview/0838712edac8e1ccea8c632724e45be43fc3bfad', N'Super Trouper', N'1nVUhbpkGwlTKxSIF6UJyM', N'https://i.scdn.co/image/e31d3165495ac1a7a1c71b31dff5e2451bc47a39', CAST(N'1980-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (285, N'7r5bS08R8d0jZuDZutVeHQ', N'Gimme! Gimme! Gimme! (A Man After Midnight)', N'ABBA', N'0LcJLqbBmaGUft1e9Mm8HV', N'https://p.scdn.co/mp3-preview/7a4c7d97fb8f066c14c33b2425bd831f28da41d8', N'Voulez-Vous', N'366R23DbfxqjZo6AUBrQjv', N'https://i.scdn.co/image/d16c2d94e7a130ec943057859187911a9cade1ab', CAST(N'1979-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (286, N'4bykJp7dORR4GoLCZiQbU0', N'Take A Chance On Me', N'ABBA', N'0LcJLqbBmaGUft1e9Mm8HV', N'https://p.scdn.co/mp3-preview/ea70d6415a51528b62e21c1588bbc62d6be1e533', N'The Album', N'5rHIYv9tgmZjvvMOMhho2x', N'https://i.scdn.co/image/84fb22663f6ee9e57e4f17e597e85303d27e32ae', CAST(N'1977-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (287, N'1kryOQS9FQDsbYY4db5zS5', N'Superstition', N'Stevie Wonder', N'7guDJrEfX3qb6FEbdPA5qi', N'https://p.scdn.co/mp3-preview/ea42d1651d5b62110aa9d250ed05718ce18919b0', N'Talking Book', N'7vgpBNK5xPmS3Mu2Hl9O0D', N'https://i.scdn.co/image/93681a1f30cc6163f92f3580db4f0f04b4ebc319', CAST(N'1972-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (288, N'0nAekUsqPk34wgTyO2AXdj', N'Higher Ground', N'Stevie Wonder', N'7guDJrEfX3qb6FEbdPA5qi', N'https://p.scdn.co/mp3-preview/1db8c10df3846c4d5701512aa8803d2793ea4fcc', N'Innervisions', N'5w9X19CBZUHOcQZjrUcDZ6', N'https://i.scdn.co/image/2d5109bd49a68eceab20b37026e9fe3547741ed5', CAST(N'1973-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (289, N'4npgZHPUKjWn6ipv6wl66Q', N'More Than Words', N'Extreme', N'6w7j5wQ5AI5OQYlcM15s2L', N'https://p.scdn.co/mp3-preview/c283ab808bf2115bec27346542b242426c0c5ffa', N'Extreme II - Pornograffitti', N'6ooTaAyanCoC3TytYtJbi2', N'https://i.scdn.co/image/6bea99e659f29dbccf2f5f9224e2c76811a369f8', CAST(N'1990-08-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (290, N'4sagNFI6iRtqK0bYxZ1yQY', N'More Than Words - Radio Edit', N'Extreme', N'6w7j5wQ5AI5OQYlcM15s2L', N'https://p.scdn.co/mp3-preview/add5471f67de2c065c09342a2d09bf11b6ac684a', N'Extreme II: Pornograffitti (Deluxe)', N'7jMiLIy96oxGm4InizGUZF', N'https://i.scdn.co/image/a9ed68e4e465b02c8254f8a87d563aec64e1492c', CAST(N'1990-08-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (291, N'7bkyXSi4GtVfD7itZRUR3e', N'Material Girl', N'Madonna', N'6tbjWDEIzxoDsBA1FuhfPW', N'https://p.scdn.co/mp3-preview/bd309c9b1d3fdbc9253cf17dc54d3457f39127dc', N'Like A Virgin', N'2IU9ftOgyRL2caQGWK1jjX', N'https://i.scdn.co/image/c43786004efad5c3c126673886348e8ff1a248b1', CAST(N'1984-11-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (292, N'1ZPlNanZsJSPK5h9YZZFbZ', N'Like A Virgin', N'Madonna', N'6tbjWDEIzxoDsBA1FuhfPW', N'https://p.scdn.co/mp3-preview/a4885223b94761b000a943671f367233af3be480', N'Like A Virgin', N'2IU9ftOgyRL2caQGWK1jjX', N'https://i.scdn.co/image/c43786004efad5c3c126673886348e8ff1a248b1', CAST(N'1984-11-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (293, N'2ubfwU154cvyo2WC2EdhED', N'One Vision - Remastered 2011', N'Queen', N'1dfeR4HaWDbWqFHLkxsg1d', N'https://p.scdn.co/mp3-preview/0ef8d02dfee4a0a0c269e7b5e96ccd3206e1e771', N'A Kind Of Magic (Deluxe Edition 2011 Remaster)', N'4pDRU9NBCmst37ZBT4hXVE', N'https://i.scdn.co/image/202abb57e2ba3c62b10d22cdd3b1421f4e79c837', CAST(N'1986-06-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (294, N'2toFtEYSfsOeynIEfVF0dh', N'A Kind Of Magic - Remastered 2011', N'Queen', N'1dfeR4HaWDbWqFHLkxsg1d', N'https://p.scdn.co/mp3-preview/28fd4ffacbae94bc989375ec12cde3c14a9eec32', N'A Kind Of Magic (Deluxe Edition 2011 Remaster)', N'4pDRU9NBCmst37ZBT4hXVE', N'https://i.scdn.co/image/202abb57e2ba3c62b10d22cdd3b1421f4e79c837', CAST(N'1986-06-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (295, N'5tp738e7ECXSNYFvdIU0D3', N'Friends Will Be Friends - Remastered 2011', N'Queen', N'1dfeR4HaWDbWqFHLkxsg1d', N'https://p.scdn.co/mp3-preview/05260e5a7f1a0938c23431aee8d033f278f49e5c', N'A Kind Of Magic (Deluxe Edition 2011 Remaster)', N'4pDRU9NBCmst37ZBT4hXVE', N'https://i.scdn.co/image/202abb57e2ba3c62b10d22cdd3b1421f4e79c837', CAST(N'1986-06-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (296, N'5XsMz0YfEaHZE0MTb1aujs', N'Wake Me up Before You Go-Go', N'Wham!', N'5lpH0xAS4fVfLkACg9DAuM', N'https://p.scdn.co/mp3-preview/d28030c29852f1b235207b91e1fd0be66d0e4309', N'Make It Big', N'0CpBTGH3Eewlbw35IclPdm', N'https://i.scdn.co/image/ef08249f3eceb3d183fade1daa3b7e869b1931e9', CAST(N'1985-02-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (297, N'7MnxdIXJd4N4mHCTPNKhkX', N'Ghostbusters - From "Ghostbusters"', N'Ray Parker, Jr.', N'0NyzfcGDZZ6GM25EBG9BYK', N'https://p.scdn.co/mp3-preview/747240ec215853cd6cf39e109d1f3519d4f19fa8', N'Ghostbusters', N'2FKg8WOQtN015jM0eiKrNz', N'https://i.scdn.co/image/31145d37c4f08c205e358b10cec2aca5778677ae', CAST(N'1984-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (298, N'5YSI1311X8t31PBjkBG4CZ', N'Wuthering Heights', N'Kate Bush', N'1aSxMhuvixZ8h9dK9jIDwL', N'https://p.scdn.co/mp3-preview/e3f64977b5017360a99f416191546f707343e54a', N'The Kick Inside', N'5NKTuBLCYhN0OwqFiGdXd1', N'https://i.scdn.co/image/79fc3db7a5827b318774cc621ab04ca0e024fca5', CAST(N'1978-02-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (299, N'7vyTKKN7FpD9zAp6f82EPp', N'Walk Like an Egyptian', N'The Bangles', N'51l0uqRxGaczYr4271pVIC', N'https://p.scdn.co/mp3-preview/d08fdbb0ce8886bf43dfbec04b6a40a2209caf9d', N'Different Light', N'4hdp78YnsVLv4Hx5wPXpOp', N'https://i.scdn.co/image/34b620e5aadd3156b139c4ea611b17bca8a53d0d', CAST(N'1985-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (300, N'798fUF6UnRn27xiVuKyJCi', N'Manic Monday', N'The Bangles', N'51l0uqRxGaczYr4271pVIC', N'https://p.scdn.co/mp3-preview/4df2424e19df66bcb868fc683b137c1d52ab6f77', N'Different Light', N'4hdp78YnsVLv4Hx5wPXpOp', N'https://i.scdn.co/image/34b620e5aadd3156b139c4ea611b17bca8a53d0d', CAST(N'1985-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (301, N'0dOg1ySSI7NkpAe89Zo0b9', N'Born in the U.S.A.', N'Bruce Springsteen', N'3eqjTLE0HfPfh78zjh6TqT', N'https://p.scdn.co/mp3-preview/b8318c15c0699e5e71da60f32f7f731dbea8717a', N'Born In The U.S.A.', N'0PMasrHdpaoIRuHuhHp72O', N'https://i.scdn.co/image/195d8359a37e94b0c1c710d1072afd8f06a1c178', CAST(N'1984-07-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (302, N'7FlwylpJSe3ea6m1IrkizS', N'West End Girls - 2001 Remastered Version', N'Pet Shop Boys', N'2ycnb8Er79LoH2AsR5ldjh', N'https://p.scdn.co/mp3-preview/b214218001600246a4ad5085b9d34b7a08151a85', N'Please: Further Listening 1984-1986', N'3rnhCB65fDQFokoeKHmM0F', N'https://i.scdn.co/image/0c61461f9a42ab1161a34de209bbf4982b66c9ed', CAST(N'1986-03-24T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (303, N'07ABETRdek3ACMpRPvQuaT', N'Always On My Mind', N'Pet Shop Boys', N'2ycnb8Er79LoH2AsR5ldjh', N'https://p.scdn.co/mp3-preview/008d38dabfa8c0995d177a41b5f3c174e779bf74', N'Discography - Complete Singles Collection', N'0Jt2LzWgtGxy3GZH5i2Kcy', N'https://i.scdn.co/image/0bb30ee737cbb0e225862803e4ca44f29214103e', CAST(N'1998-03-31T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (304, N'6vYK729O29XnvQqPWyLPfe', N'It''s A Sin - 2001 Remastered Version', N'Pet Shop Boys', N'2ycnb8Er79LoH2AsR5ldjh', N'https://p.scdn.co/mp3-preview/5b9923a0335fb57c97b65ededb71ab585fbe583c', N'Actually: Further Listening 1987-1988', N'1rpYTarp7Bam68zdhw7EXG', N'https://i.scdn.co/image/226cc0b338d9133aa855bf4de66175764ec6d5a1', CAST(N'1987-09-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (305, N'2dO88mixgzqmgy56wFUVSY', N'I Think We''re Alone Now', N'Tiffany', N'4C3uGP8vRDzxrhJxZiOjTe', N'https://p.scdn.co/mp3-preview/e63b0a7247e938b8ff656c405bf93a07231912f3', N'Tiffany', N'298E55DESLiYPECZUKXd7I', N'https://i.scdn.co/image/5db4bb8068fe8b67c788b0ae66877b89e441b816', CAST(N'1987-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (306, N'4bO6DljpuAeQh6HS20i0I5', N'Money For Nothing', N'Dire Straits', N'0WwSkZ7LtFUFjGjMZBMt6T', N'https://p.scdn.co/mp3-preview/f262b55ad5df6f74c95e1886b42e01fe0e5b248f', N'Brothers In Arms - 20th Anniversary Edition', N'0u7sgzvlLmPLvujXxy9EeY', N'https://i.scdn.co/image/dbe99695067239acb4f13052e6a4c7399bceafd1', CAST(N'1985-05-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (307, N'60bF2b61f7Q5Bt82QCBwvc', N'Brothers In Arms', N'Dire Straits', N'0WwSkZ7LtFUFjGjMZBMt6T', N'https://p.scdn.co/mp3-preview/1999ee75aa6ace713fe6ad9321cad4db163f7a8b', N'Brothers In Arms - 20th Anniversary Edition', N'0u7sgzvlLmPLvujXxy9EeY', N'https://i.scdn.co/image/dbe99695067239acb4f13052e6a4c7399bceafd1', CAST(N'1985-05-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (308, N'2PfBSkCKZDXMsJogMT0wML', N'Jump', N'Van Halen', N'2cnMpRsOVqtPMfq7YiFE6K', N'https://p.scdn.co/mp3-preview/9063dc9785706f06677ddd900c702a59035a8cc5', N'1984', N'6x2n6wj3WvkRi8J8gxEcF0', N'https://i.scdn.co/image/9da1fc4cee8acf14f09a323c5f2dd3e781ca2138', CAST(N'1984-01-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (309, N'2tAeN2TKlQLOoSPXtARzBV', N'Eruption - 2015 Remastered', N'Van Halen', N'2cnMpRsOVqtPMfq7YiFE6K', N'https://p.scdn.co/mp3-preview/b9bad4e09dd97cfc032b8222ac8a25bf0884fdd0', N'Van Halen (Remastered)', N'7DdEbYFPKTZ8KB4z6L4UnQ', N'https://i.scdn.co/image/532648ba03f3a56da77b87cf1a489bf7cf94a246', CAST(N'1978-02-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (310, N'0upLyFR8Rr52ZpMp5esQoq', N'You Really Got Me - 2015 Remastered', N'Van Halen', N'2cnMpRsOVqtPMfq7YiFE6K', N'https://p.scdn.co/mp3-preview/4e09d39c60452af6e7c7c0758fca8c1b51f8335c', N'Van Halen (Remastered)', N'7DdEbYFPKTZ8KB4z6L4UnQ', N'https://i.scdn.co/image/532648ba03f3a56da77b87cf1a489bf7cf94a246', CAST(N'1978-02-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (311, N'3Tsz5B3KuYpqtwt1QZZ8S7', N'Love In The First Degree', N'Bananarama', N'3sc7iUG1Wwpwx7bHeZolgx', N'https://p.scdn.co/mp3-preview/38fb5e84943f17de1fc4f63f5923423d6a0d5201', N'Wow! (Platinum Re-Issue)', N'3OBIB9XWELY1pbHXAJILvx', N'https://i.scdn.co/image/a5b7c20b49f16eaca9ffdfd2561d323c382fde28', CAST(N'1987-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (312, N'54bwQKQJRVckJGBKuns8MI', N'Robert De Niro''s Waiting', N'Bananarama', N'3sc7iUG1Wwpwx7bHeZolgx', N'https://p.scdn.co/mp3-preview/529946d7ad435f248edf15159716d7969d9008d4', N'Bananarama (Platinum Re-Issue)', N'0rFjXnUbT939RcKeZDGBG1', N'https://i.scdn.co/image/0a3f808a837dbe0b9c43bf71a8fd1ffeca117c15', CAST(N'1984-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (315, N'2M3E9wbFtqdkSGkhfHikFh', N'I Know Him So Well', N'Elaine Paige', N'7KckozT8XPOqtgJjpAcrnA', N'https://p.scdn.co/mp3-preview/1a19f12cc0bf5602cc5c5e8de9c8c24cf8203696', N'Love Hurts', N'43KUczsSjyfpXlWuylA62Y', N'https://i.scdn.co/image/9eacc830b88aded94658534ae2305505e4c97ae0', CAST(N'1985-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (316, N'6GElvNcpLw9RSAov7lQeGm', N'Spirit in the Sky', N'Doctor & The Medics', N'0auxGqduSBWubpKjjSNKLr', N'https://p.scdn.co/mp3-preview/ef9e90585fba9263d489187282a7e64bbf994483', N'Laughing At the Pieces', N'6lduThZF6oTfs4sM6WVZ7S', N'https://i.scdn.co/image/616fa060b647f468ffe9bef43cebb4b51eebbbf8', CAST(N'1986-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (317, N'4umQbcdBF3YVsNBvvnFLiX', N'A Good Heart', N'Feargal Sharkey', N'3zk5lgbVEre0rKRBqiKt0T', N'https://p.scdn.co/mp3-preview/038fec0b60ff7dfb3d25db75bd7aa023b929e6f1', N'Feargal Sharkey', N'1fnuPLerUrbVfzcHyY6H5N', N'https://i.scdn.co/image/8bb1995562401522837f682eab084cbc89a6956e', CAST(N'1985-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (318, N'10ey3FjYGiU95BQLJ10rBR', N'When Will I Be Famous?', N'Bros', N'2LKrAJVB1842xPDvx4uuwU', N'https://p.scdn.co/mp3-preview/9839313fef45906abf7e3e1f7b6ecaed30cff958', N'PUSH', N'1wew1jGkLYzH2eDHnGm0j2', N'https://i.scdn.co/image/7ab88f156267f5dda6d3cf73d8de2e5a8accb10c', CAST(N'1988-03-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (319, N'7yOWjWMDfvxTXbULjQpzjO', N'I Owe You Nothing', N'Bros', N'2LKrAJVB1842xPDvx4uuwU', N'https://p.scdn.co/mp3-preview/139ee9f1f9f5764c8418dc379dbd7ee10401af0e', N'PUSH', N'1wew1jGkLYzH2eDHnGm0j2', N'https://i.scdn.co/image/7ab88f156267f5dda6d3cf73d8de2e5a8accb10c', CAST(N'1988-03-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (320, N'4uLU6hMCjMI75M1A2tKUQC', N'Never Gonna Give You Up', N'Rick Astley', N'0gxyHStUsqpMadRV0Di1Qt', N'https://p.scdn.co/mp3-preview/f60c420261754542594ddb4a46ed42972d2b9fd0', N'Whenever You Need Somebody', N'6N9PS4QXF1D0OWPk0Sxtb4', N'https://i.scdn.co/image/d06720ca93a55cb751dd74c9fac887924b6f7dd0', CAST(N'1987-11-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (321, N'7w6PJe5KBPyvuRYxFkPssC', N'No More Tears', N'Ozzy Osbourne', N'6ZLTlhejhndI4Rh53vYhrY', N'https://p.scdn.co/mp3-preview/6a402ac16c927eaa19b0b2d31781e1f65d6132db', N'No More Tears (Bonus Track Version)', N'6eh82ojicL8RSJF7GkYTh7', N'https://i.scdn.co/image/6c3292ac6db0f9384927e5060e93af1eca489c41', CAST(N'1991-09-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (322, N'0P41648ifNoc7bSYLHlTPE', N'A Thousand Trees', N'Stereophonics', N'21UJ7PRWb3Etgsu99f8yo8', N'https://p.scdn.co/mp3-preview/dd314bbf167bbc0629f203c75dbc08af5ba6e57a', N'Word Gets Around - Deluxe Edition', N'6z7UHYrklILSMCiShu6quA', N'https://i.scdn.co/image/4faeefef2f23ff4d197072ef00d1716fa88cd7bb', CAST(N'1997-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (323, N'34Qor4gyI1ZxV9nrlikcA9', N'The Bartender And The Thief', N'Stereophonics', N'21UJ7PRWb3Etgsu99f8yo8', N'https://p.scdn.co/mp3-preview/0265d6fbb4347bb322f1a2b5a9f5b92e7a037292', N'Performance And Cocktails', N'3FbqcZMe2HUUd7WjRquADe', N'https://i.scdn.co/image/48ca7a2f8f5e316f8f0982e2bd4afec382795ede', CAST(N'1999-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (324, N'1HkgXusDtcdUch40stX4vp', N'The Day We Caught The Train', N'Ocean Colour Scene', N'5vIOGcdmx1eIkq3ZtuS12U', N'https://p.scdn.co/mp3-preview/3b3601933c6ea29a284f06d58d2559654404a914', N'Moseley Shoals', N'4PNGCsIJUFlEoDFhzcu9Il', N'https://i.scdn.co/image/6f3922f4be864fd08811f7d256dc3105fe84f719', CAST(N'1996-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (325, N'5t5rCnsgRBtcKqTB7SbD1Q', N'High Enough', N'Damn Yankees', N'7ihLzUpuNecU5VBkvOUDNq', N'https://p.scdn.co/mp3-preview/f1a40744920bfde84f7925af2d56b0fbd7f9e1b1', N'Damn Yankees', N'2GSZ2kruaBmA5hR9xngeBX', N'https://i.scdn.co/image/2befb55051e597efe6212984a5064cdced5b0c15', CAST(N'1990-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (326, N'6MQvBJCobZYZf7B5bKqv8D', N'Walk This Way', N'RUN-DMC', N'3CQIn7N5CuRDP8wEI7FiDA', N'https://p.scdn.co/mp3-preview/d04c8b3891d832921c234dc6f928d71de7969317', N'Raising Hell', N'0PanG8trSzqFIX7pZmCVFG', N'https://i.scdn.co/image/5aa02c97d36aec69237b0e000d3bd359ac0591a9', CAST(N'1986-05-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (327, N'2dWCp5vcNwSy25zRVFGC5t', N'Shine On You Crazy Diamond (Parts 1 - 5) [2011 - Remaster]', N'Pink Floyd', N'0k17h0D3J5VfsdmQ1iZtE9', N'https://p.scdn.co/mp3-preview/dc23b3bdd8dd520220dd6c8af62d6bd75eb423a1', N'Wish You Were Here [2011 - Remaster] (2011 Remastered Version)', N'1x0uzT3ETlIYjPueTyNfnQ', N'https://i.scdn.co/image/d55ddbc595a425c840f020ff245b39d0ea7e8e35', CAST(N'1975-09-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (328, N'1wHSxWBfPr3GO31y8KGrWe', N'Wish You Were Here - 2011 Remastered Version', N'Pink Floyd', N'0k17h0D3J5VfsdmQ1iZtE9', N'https://p.scdn.co/mp3-preview/cce05a03c838bbf7fee2b64b3698c229562ce580', N'Wish You Were Here [2011 - Remaster] (2011 Remastered Version)', N'1x0uzT3ETlIYjPueTyNfnQ', N'https://i.scdn.co/image/d55ddbc595a425c840f020ff245b39d0ea7e8e35', CAST(N'1975-09-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (329, N'0EHzXpyi1swR8sMpbVHcLJ', N'Civil War', N'Guns N'' Roses', N'3qm84nBOXUEQ2vnTfUTTFC', N'https://p.scdn.co/mp3-preview/514c2b443668cec75964c408fe26520f91360084', N'Use Your Illusion II', N'0yMBzueqNjfhtmhz0AthB7', N'https://i.scdn.co/image/fccb5b4a09c57cb4b929c4b07c31e809808a82c5', CAST(N'1991-09-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (330, N'4sWQumWATimibc9D4j3BRY', N'She''s So Fine', N'Thunder', N'3SfrwwVPGtjYTI3vwQ4hEU', N'https://p.scdn.co/mp3-preview/7c79dcc8e42b0deef7110e5f55af7e6f2c255d85', N'Their Finest Hour (And A Bit)', N'6MEWknfUodPy5ww71oD9cf', N'https://i.scdn.co/image/e54965cb97fb1834e3a784e54a430d7d4157d745', CAST(N'1995-09-25T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (332, N'64otvDsAAAmLVTSEM2FYSW', N'Movin'' on Up', N'Primal Scream', N'3wury2nd8idV4GecUg5xze', N'https://p.scdn.co/mp3-preview/8539baa3299bd700ddcd20112ee3f1ccb74cc25f', N'Screamadelica', N'3Kkocxhs4Ek537j67DFNd7', N'https://i.scdn.co/image/c364891f22de1526ebc0102a1864a4c2611d85ae', CAST(N'1991-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (333, N'1P83JLGQz1XXCJ5hTMGRMY', N'Driven By You', N'Queen', N'1dfeR4HaWDbWqFHLkxsg1d', N'https://p.scdn.co/mp3-preview/d40728afaa1beac481f704cd04f04de1636baeca', N'Greatest Hits III', N'2BY5L3fpnj4pEduW3T1qN7', N'https://i.scdn.co/image/a813536a8626e8e9632401cec8e0a6157ffa4bd5', CAST(N'1999-11-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (334, N'2qkmPUG7ARsRwhVICQVwQS', N'Mercy', N'Muse', N'12Chz98pHFMPJEknJQMWvI', N'https://p.scdn.co/mp3-preview/4032f82781095d6fe3c45da6ea81b50c38b505bc', N'Drones', N'2wart5Qjnvx1fd7LPdQxgJ', N'https://i.scdn.co/image/8978459cc3ad68b39bd6dbda418625b06ba5d80c', CAST(N'2015-06-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (335, N'5xRYEnLUno3P8LmAxjFuLg', N'Yella Green Grass', N'Jack Cade', N'2hNEMcGtnzp1emSA6XtHf7', N'https://p.scdn.co/mp3-preview/a965f94992b34b9e5b0d130e43ce8264957d99fd', N'A Murder of Crows', N'6zPQpl9uac8giAGeZ5xgSK', N'https://i.scdn.co/image/cd1792ad3cb3d3a797d0400c08be9e887979f1f8', CAST(N'2016-04-08T00:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Tracks] OFF
GO
SET IDENTITY_INSERT [dbo].[UserPlaylists] ON 
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (191, N'erotheray', N'1pRndXCyYuNxurrSqtWw5Y')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (192, N'erotheray', N'3SdTKo2uVsxFblQjpScoHy')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (193, N'erotheray', N'5GWHzvmJIrGQ5F4m7MUtfN')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (194, N'erotheray', N'52HAHV1j93s5B8GoTNI7DJ')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (195, N'erotheray', N'7s25THrKz86DM225dOYwnr')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (196, N'erotheray', N'5UgT7w6zVZjP3oyawMzbiK')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (197, N'erotheray', N'5uvosCdMlFdTXhoazkTI5R')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (198, N'erotheray', N'6ToM0uwxtPKo9CMpbPGYvM')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (199, N'erotheray', N'3XxBSvDZKH5YvZZjTpn6eR')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (200, N'erotheray', N'23MrkN7g6Q5U7GLIxNHN1B')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (201, N'erotheray', N'0NWPxcsf5vdjdiFUI8NgkP')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (202, N'erotheray', N'0wJoRiX5K5BxlqZTolB2LD')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (203, N'erotheray', N'2BcvvHttiZRvguFM4hR398')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (204, N'erotheray', N'7uEcCGtM1FBBGIhPozhJjv')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (205, N'erotheray', N'5X76oXHcR5uCXali0gOyX5')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (206, N'erotheray', N'2aoo2jlRnM3A0NyLQqMN2f')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (207, N'erotheray', N'4sFbojhVXQv7dBC9PVCcRn')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3832, N'davemateer', N'0c4IEciLCDdXEhhKxj4ThA')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3833, N'davemateer', N'4VqPOruhp5EdPBeR92t6lQ')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3834, N'davemateer', N'3skn2lauGk7Dx6bVIt5DVj')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3835, N'davemateer', N'1UBQ5GK8JaQjm5VbkBZY66')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3836, N'davemateer', N'7t6CAWplijBj4sdl0q3z0e')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3837, N'davemateer', N'11cPCZ0BYWJmAm7N8eDxtu')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3838, N'davemateer', N'0N7LKqYxUrg5UFb6Z4OSDF')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3839, N'davemateer', N'1AhDOtG9vPSOmsWgNW0BEY')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3840, N'davemateer', N'4pbJqGIASGPr0ZpGpnWkDn')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3841, N'davemateer', N'32OlwWuMpZ6b0aN2RZOeMS')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3842, N'davemateer', N'7LygtNjQ65PSdzVjUnHXQb')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3843, N'davemateer', N'6mcxQ1Y3uQRU0IHsvdNLH1')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3844, N'davemateer', N'3ixTiPABjqkBKPocxq6oIe')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3845, N'davemateer', N'5XkVQZWvsVwedk0Jv54SVH')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3846, N'davemateer', N'3E14pb0zKtI9ugTGzWOOjU')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3847, N'davemateer', N'6L89mwZXSOwYl76YXfX13s')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3848, N'davemateer', N'6nTiIhLmQ3FWhvrGafw2zj')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3849, N'davemateer', N'6ORqU0bHbVCRjXm9AjyHyZ')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3850, N'davemateer', N'2C5l2dK6ep2JRgQ9UenCBs')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3851, N'davemateer', N'5fpj84RsT9cOTfWUCxBTXu')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3852, N'davemateer', N'6QPKYGnAW9QozVz2dSWqRg')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3853, N'davemateer', N'174oVPYb0RogxSyQXqlUWx')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3854, N'davemateer', N'5ERnPWGQc5QK7M7HW3rjC6')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3855, N'davemateer', N'2LlA15ivxoM2Oi3Q4vGtHV')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3856, N'davemateer', N'3gHIINSk3F9nBowhz8HJuh')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3857, N'davemateer', N'7o2CTH4ctstm8TNelqjb51')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3858, N'davemateer', N'3YBZIN3rekqsKxbJc9FZko')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3859, N'davemateer', N'53968oKecrFxkErocab2Al')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3860, N'davemateer', N'2C4aYxNpoPkmoZ3ZdPeuOB')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3861, N'davemateer', N'7dblNGnRXEBrVJunazs2U5')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3862, N'davemateer', N'1KQwTDBlfsZBjV7qElWnmS')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3863, N'davemateer', N'3SdTKo2uVsxFblQjpScoHy')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3864, N'davemateer', N'5GWHzvmJIrGQ5F4m7MUtfN')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3865, N'davemateer', N'4sFbojhVXQv7dBC9PVCcRn')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3866, N'davemateer', N'7uEcCGtM1FBBGIhPozhJjv')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3867, N'davemateer', N'7s25THrKz86DM225dOYwnr')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3868, N'davemateer', N'46iPLIwKPJ1b3A4whrCi3z')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3869, N'davemateer', N'225xvV8r1yKMHErSWivnow')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3870, N'davemateer', N'1QEEqeFIZktqIpPI4jSVSF')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3871, N'davemateer', N'70C4NyhjD5OZUMzvWZ3njJ')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3872, N'davemateer', N'2zvot9pY2FNl1E94kc4K8M')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3873, N'davemateer', N'51pQ7vY7WXzxskwloaeqyj')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3874, N'davemateer', N'6kjlvJLh2DBsSQtqVzFh8I')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3875, N'davemateer', N'12qZHAeOyTf93YAWvGDTat')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3876, N'davemateer', N'7woZGXjtaYwuvSoU1zToB3')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3877, N'davemateer', N'11d9oUiwHuYt216EFA2tiz')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3878, N'davemateer', N'78TnMTAFmWUWWCgNXR7D3K')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3879, N'davemateer', N'1B75hgRqe7A4fwee3g3Wmu')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3880, N'davemateer', N'5xzN3p8DlPv7bBhV8mCdao')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3881, N'davemateer', N'7w9bgPAmPTtrkt2v16QWvQ')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3882, N'davemateer', N'6vR4LDbi4H6iwC3YDUL6jT')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3883, N'davemateer', N'52HAHV1j93s5B8GoTNI7DJ')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3884, N'davemateer', N'6r20M5DWYdIoCDmDViBxuz')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3885, N'davemateer', N'1pRndXCyYuNxurrSqtWw5Y')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3886, N'davemateer', N'7haFcQaoTBr2qY6G0r4JSH')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3887, N'davemateer', N'4ue5ET9msGNJSO6sSbrCVE')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3888, N'davemateer', N'1lCRw5FEZ1gPDNPzy1K4zW')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3889, N'davemateer', N'5SZ6zX4rOrEQferfFC2MfP')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3890, N'davemateer', N'2cBGl1Ehr1D9xbqNmraqb4')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3891, N'davemateer', N'1blHMFNrpEafM2GG5K5pnm')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3892, N'davemateer', N'7D7tJseXUZAxhg7l8RbTOj')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3893, N'davemateer', N'39J10NL0mFTAdJbapoo2rC')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3894, N'davemateer', N'1HlGblweLq0eAwnb0NY1EQ')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3895, N'davemateer', N'4qO03RMQm88DdpTJcxlglY')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3896, N'davemateer', N'5C0LFQARavkPpn7JgA4sLk')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3897, N'davemateer', N'3FmAUR4SPWa3P1KyDf21Fu')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3898, N'davemateer', N'6ejipC6dh8CGi2WiUACOvN')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3899, N'davemateer', N'24GaspdcJWLts2R1wurDfW')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3900, N'davemateer', N'0LN0ASTtcGIbNTnjSHG6eO')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3901, N'davemateer', N'5p34sF7EskpzTuW3RGy9fs')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3902, N'davemateer', N'6AJlcxjEO2baFC24GPsJjg')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3903, N'davemateer', N'2oUeXNq3vYqB60LB1D219g')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3904, N'davemateer', N'6TPAhgpBvhMIDUzmDnWJmj')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3905, N'davemateer', N'0M5wW96q1hkvIlmuw131g9')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3906, N'davemateer', N'5K8gqK84cFZV1dFJAMC0jU')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3907, N'davemateer', N'6Z435tBPT5JamUR9dN7y8y')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3908, N'davemateer', N'7ntdCok2CiwTmyiAh96N10')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3909, N'davemateer', N'567EwOGPAXg7Y9DQZTEFEE')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3910, N'davemateer', N'63ZUgNxorR2j1Au8iHBhDQ')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3911, N'davemateer', N'43eBgYRTmu5BJnCJDBU5Hb')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3912, N'davemateer', N'4EFkvOhgAmlHEfDfvfSoh5')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3913, N'davemateer', N'5gMnyAfZHIZ2eC8lSTBPQI')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3914, N'davemateer', N'1K3RzyzlBhMzOZtR0yepeb')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3915, N'davemateer', N'3L7RtEcu1Hw3OXrpnthngx')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3916, N'davemateer', N'6eTZyUjg4ZoGElNcAINIwJ')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3917, N'davemateer', N'0LGIp29J62jAVkyr401Ytu')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3918, N'davemateer', N'7AmdLtDBBMHWTvneMLm8Nj')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3919, N'davemateer', N'64B4UbGRLtGRBtiN2m8OvF')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3920, N'davemateer', N'4NH4xiPQ7TqNGqj6pZV4ki')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3921, N'davemateer', N'0TF3F5Lw5apoD1zvR8LikO')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3922, N'davemateer', N'2HXixVqzzm9rEUIMAWzshl')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3923, N'davemateer', N'1TfqLAPs4K3s2rJMoCokcS')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3924, N'davemateer', N'2hbA72TFulrNGTEBUMAnzG')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3925, N'davemateer', N'7ba7mwoleFlwmOiuqw8XNf')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3926, N'davemateer', N'1mdlNDjI26EaMUNA1Ti9Xy')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3927, N'davemateer', N'2xpWp44LowsqtKEilDZzln')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3928, N'davemateer', N'6oWpGuwokWJ4EcWgVQPdUt')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3929, N'davemateer', N'5nydh0uIcz9gxSoJY6FtTn')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3930, N'davemateer', N'6jFOG89lRSnBD8QDExis0s')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3931, N'davemateer', N'4f2QcB0RYGz70dXGjvpR0w')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3932, N'davemateer', N'7itr4N5bXkAWesPUomCNf7')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3933, N'davemateer', N'0SvfyHYDp2uIsHt53LDlI9')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3934, N'davemateer', N'0OBwxFLu6Yj61s2OagYbgY')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3935, N'davemateer', N'6s0NHplywwr1IjnQpUpWJk')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3936, N'davemateer', N'5tyHxEsVUFUsb1yzAObAxu')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3937, N'davemateer', N'2Rw3rN4jQim09uCj7kV1L5')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3938, N'davemateer', N'29xKs5BAHlmlX1u4gzQAbJ')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3939, N'davemateer', N'3VEFybccRTeWSZRkJxDuNR')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3940, N'davemateer', N'2JdzB67NvIa90K4gEZPLeX')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3941, N'davemateer', N'7bCKBqdYJI8fvFH48sT2IN')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3942, N'davemateer', N'37EJtTS7jT5WUyXGZzrwnI')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3943, N'davemateer', N'4vJr55lngvhSM8WIh9CjQc')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3944, N'davemateer', N'6RVhP2FB2UNWZzs9aOOCB2')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3945, N'davemateer', N'6YEOmCsXSk9ZPE0FkcCiuQ')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3946, N'davemateer', N'2udGjDmpK1dH9VGyw7nrei')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3947, N'davemateer', N'7hxnlRuYmF1rU5WO6Obw8I')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3948, N'davemateer', N'2BcvvHttiZRvguFM4hR398')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3949, N'davemateer', N'5X76oXHcR5uCXali0gOyX5')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3950, N'davemateer', N'2aoo2jlRnM3A0NyLQqMN2f')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3951, N'davemateer', N'0wJoRiX5K5BxlqZTolB2LD')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3952, N'davemateer', N'0NWPxcsf5vdjdiFUI8NgkP')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3953, N'davemateer', N'23MrkN7g6Q5U7GLIxNHN1B')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3954, N'davemateer', N'3XxBSvDZKH5YvZZjTpn6eR')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3955, N'davemateer', N'6ToM0uwxtPKo9CMpbPGYvM')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3956, N'davemateer', N'5uvosCdMlFdTXhoazkTI5R')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3957, N'davemateer', N'5UgT7w6zVZjP3oyawMzbiK')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3958, N'davemateer', N'1Q5kgpp4pmyGqPwNBzkSrw')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3959, N'davemateer', N'0n2SEXB2qoRQg171q7XqeW')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3960, N'davemateer', N'4abPGwvqR26EVyXJI72VRP')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3961, N'davemateer', N'0dDjBeUnkgwFJIym4rhhR2')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3962, N'davemateer', N'0bVtevEgtDIeRjCJbK3Lmv')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3963, N'davemateer', N'04MNKrAnzrHDUzuXAtNoLr')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3964, N'davemateer', N'6DzuDDN9q4N29QXWDuQ8sx')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3965, N'davemateer', N'0l37J5l4eJfIdd7cea1Cl5')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3966, N'davemateer', N'3O0ZuqmDLb6ph2PVg6SAKW')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3967, N'davemateer', N'3B9VueMM1VPiOkW56KSRrB')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3968, N'davemateer', N'2aEeghgUcnu75tzcolFMfs')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3969, N'davemateer', N'3TYiUYbVAfTM9GnCcBf8Um')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3970, N'davemateer', N'6qfIne1xNg5GDcmg73x0N8')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3971, N'davemateer', N'6MIC4Z7pSY5oKLmgzdyK1z')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3972, N'davemateer', N'48i055G1OT5KxGGftwFxWy')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3973, N'davemateer', N'0FoYHGrCnI8zF4utpPiHWx')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3974, N'davemateer', N'6DSvUZQdqtNfkJI4cAiUsM')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3975, N'davemateer', N'310epXrlbXmfGcD1qSdgVV')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3976, N'davemateer', N'7j33vQkg76nP0TzzfoolXg')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3977, N'davemateer', N'6h4ApkdXMPF699JAY1LkVS')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3978, N'davemateer', N'7gfO970gk60AhrXA2TmDad')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3979, N'davemateer', N'60zZFaec4f4TlWECYh002L')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3980, N'davemateer', N'4Ud87Zsx32FeLrFUc6vEt9')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3981, N'davemateer', N'5ZMftP47riIvJzVgdEirjL')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3982, N'davemateer', N'4WqHM9bVa6kMxRE66stmmH')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3983, N'davemateer', N'1hnrMwnGtXIosKpFWAImeV')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3984, N'davemateer', N'2b9lp5A6CqSzwOrBfAFhof')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3985, N'davemateer', N'0S3gpZzlT9Hb7CCSV2owX7')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3986, N'davemateer', N'5XfWzGa5zuz88IOYbWNTMa')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3987, N'davemateer', N'7GtdbucESxLrec2lslRLEa')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3988, N'davemateer', N'7JFysVNd8IeMpKLt4SEjN4')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3989, N'davemateer', N'2miAut6dp9BWdGmOxwSGEC')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3990, N'davemateer', N'5PjJxigUDDDrBhGO2FZ5sV')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3991, N'davemateer', N'0BB9eUBBaaX6GALSYNcEp7')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3992, N'davemateer', N'2BPfKiV9U0CR1dpUgeUwuH')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3993, N'davemateer', N'2mHs6wQRQ5slNOZ7SwFiHP')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3994, N'davemateer', N'6ZKlm17z22OxkzgemE4aos')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3995, N'davemateer', N'2olVm1lHicpveMAo4AUDRB')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3996, N'davemateer', N'5MKmykXnrQEhvcD4B2rrdR')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3997, N'davemateer', N'3W4AjgtJvG19wAvH27xDGb')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3998, N'davemateer', N'1med9ijNdCwxnyS8vBpfhR')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3999, N'davemateer', N'6fNg0XJSCq1Dn8GEtoDxbB')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (4000, N'davemateer', N'7eRAk2pnZDWhAiMmUdAOlb')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (4001, N'davemateer', N'2FvP0JM1amEXXNlcBUr37C')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (4002, N'davemateer', N'3v7Hpshu7Lppgw8kSsy5ly')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (4003, N'davemateer', N'5VVwwfK6Cp9IydkhKfJUEq')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (4004, N'davemateer', N'0whc72kLlbhR5QMmj9XPnb')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (4005, N'davemateer', N'5Ac8sOEk91RTzD06ViNzqf')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (4006, N'davemateer', N'0odIT9B9BvOCnXfS0e4lB5')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (4007, N'davemateer', N'7fSGbZLhWlAiCC3HDPAULu')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (4008, N'davemateer', N'6oD0TvHIYmObKNl5Mz05ri')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (4009, N'davemateer', N'0wzABO1igQsSy8cQ7dIeHK')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (4010, N'davemateer', N'6l8EbYRtQMgKOyc1gcDHF9')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (4011, N'davemateer', N'1eN42Q7IWRzRBq8eW2Y2TE')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (4012, N'davemateer', N'6QhXQOpyYvbpdbyjgAqKdY')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (4013, N'davemateer', N'4uIjNF84ZbteunNMxr4Xc0')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (4014, N'davemateer', N'76TZCvJ8GitQ2FA1q5dKu0')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (4015, N'davemateer', N'61ZVP6ytLwYnbLonbJtzR6')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (4016, N'davemateer', N'1PJu7IPmGJZx5fAQeL4trB')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (4017, N'davemateer', N'1NrrxP9dXEAgPmb2UQEXOJ')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (4018, N'davemateer', N'01iyCAUm8EvOFqVWYJ3dVX')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (4019, N'davemateer', N'5ztQHTm1YQqcTkQmgDEU4n')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (4020, N'davemateer', N'5kBZR12AntJUTo9UeAsKqP')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (4021, N'davemateer', N'7r5bS08R8d0jZuDZutVeHQ')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (4022, N'davemateer', N'4bykJp7dORR4GoLCZiQbU0')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (4023, N'davemateer', N'1kryOQS9FQDsbYY4db5zS5')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (4024, N'davemateer', N'0nAekUsqPk34wgTyO2AXdj')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (4025, N'davemateer', N'4npgZHPUKjWn6ipv6wl66Q')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (4026, N'davemateer', N'4sagNFI6iRtqK0bYxZ1yQY')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (4027, N'davemateer', N'7bkyXSi4GtVfD7itZRUR3e')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (4028, N'davemateer', N'1ZPlNanZsJSPK5h9YZZFbZ')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (4029, N'davemateer', N'2ubfwU154cvyo2WC2EdhED')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (4030, N'davemateer', N'2toFtEYSfsOeynIEfVF0dh')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (4031, N'davemateer', N'5tp738e7ECXSNYFvdIU0D3')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (4032, N'davemateer', N'5XsMz0YfEaHZE0MTb1aujs')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (4033, N'davemateer', N'7MnxdIXJd4N4mHCTPNKhkX')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (4034, N'davemateer', N'5YSI1311X8t31PBjkBG4CZ')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (4035, N'davemateer', N'7vyTKKN7FpD9zAp6f82EPp')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (4036, N'davemateer', N'798fUF6UnRn27xiVuKyJCi')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (4037, N'davemateer', N'0dOg1ySSI7NkpAe89Zo0b9')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (4038, N'davemateer', N'7FlwylpJSe3ea6m1IrkizS')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (4039, N'davemateer', N'07ABETRdek3ACMpRPvQuaT')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (4040, N'davemateer', N'6vYK729O29XnvQqPWyLPfe')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (4041, N'davemateer', N'2dO88mixgzqmgy56wFUVSY')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (4042, N'davemateer', N'4bO6DljpuAeQh6HS20i0I5')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (4043, N'davemateer', N'60bF2b61f7Q5Bt82QCBwvc')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (4044, N'davemateer', N'2PfBSkCKZDXMsJogMT0wML')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (4045, N'davemateer', N'2tAeN2TKlQLOoSPXtARzBV')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (4046, N'davemateer', N'0upLyFR8Rr52ZpMp5esQoq')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (4047, N'davemateer', N'3Tsz5B3KuYpqtwt1QZZ8S7')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (4048, N'davemateer', N'54bwQKQJRVckJGBKuns8MI')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (4049, N'davemateer', N'2M3E9wbFtqdkSGkhfHikFh')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (4050, N'davemateer', N'6GElvNcpLw9RSAov7lQeGm')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (4051, N'davemateer', N'4umQbcdBF3YVsNBvvnFLiX')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (4052, N'davemateer', N'10ey3FjYGiU95BQLJ10rBR')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (4053, N'davemateer', N'7yOWjWMDfvxTXbULjQpzjO')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (4054, N'davemateer', N'4uLU6hMCjMI75M1A2tKUQC')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (4055, N'davemateer', N'7w6PJe5KBPyvuRYxFkPssC')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (4056, N'davemateer', N'0P41648ifNoc7bSYLHlTPE')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (4057, N'davemateer', N'34Qor4gyI1ZxV9nrlikcA9')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (4058, N'davemateer', N'1HkgXusDtcdUch40stX4vp')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (4059, N'davemateer', N'5t5rCnsgRBtcKqTB7SbD1Q')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (4060, N'davemateer', N'6MQvBJCobZYZf7B5bKqv8D')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (4061, N'davemateer', N'2dWCp5vcNwSy25zRVFGC5t')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (4062, N'davemateer', N'1wHSxWBfPr3GO31y8KGrWe')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (4063, N'davemateer', N'0EHzXpyi1swR8sMpbVHcLJ')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (4064, N'davemateer', N'4sWQumWATimibc9D4j3BRY')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (4065, N'davemateer', N'64otvDsAAAmLVTSEM2FYSW')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (4066, N'davemateer', N'1P83JLGQz1XXCJ5hTMGRMY')
GO
SET IDENTITY_INSERT [dbo].[UserPlaylists] OFF
GO
ALTER TABLE [dbo].[Votes]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Votes_dbo.Jokes_Joke_ID] FOREIGN KEY([Joke_ID])
REFERENCES [dbo].[Jokes] ([ID])
GO
ALTER TABLE [dbo].[Votes] CHECK CONSTRAINT [FK_dbo.Votes_dbo.Jokes_Joke_ID]
GO
