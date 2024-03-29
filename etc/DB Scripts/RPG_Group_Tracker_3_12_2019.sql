USE [master]
GO
/****** Object:  Database [RPG_Group_Tracker]    Script Date: 3/12/2019 11:25:00 PM ******/
CREATE DATABASE [RPG_Group_Tracker]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RPG_Group_Tracker', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\RPG_Group_Tracker.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'RPG_Group_Tracker_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\RPG_Group_Tracker_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [RPG_Group_Tracker] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RPG_Group_Tracker].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RPG_Group_Tracker] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RPG_Group_Tracker] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RPG_Group_Tracker] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RPG_Group_Tracker] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RPG_Group_Tracker] SET ARITHABORT OFF 
GO
ALTER DATABASE [RPG_Group_Tracker] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RPG_Group_Tracker] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RPG_Group_Tracker] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RPG_Group_Tracker] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RPG_Group_Tracker] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RPG_Group_Tracker] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RPG_Group_Tracker] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RPG_Group_Tracker] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RPG_Group_Tracker] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RPG_Group_Tracker] SET  DISABLE_BROKER 
GO
ALTER DATABASE [RPG_Group_Tracker] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RPG_Group_Tracker] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RPG_Group_Tracker] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RPG_Group_Tracker] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RPG_Group_Tracker] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RPG_Group_Tracker] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RPG_Group_Tracker] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RPG_Group_Tracker] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [RPG_Group_Tracker] SET  MULTI_USER 
GO
ALTER DATABASE [RPG_Group_Tracker] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RPG_Group_Tracker] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RPG_Group_Tracker] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RPG_Group_Tracker] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [RPG_Group_Tracker] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [RPG_Group_Tracker] SET QUERY_STORE = OFF
GO
USE [RPG_Group_Tracker]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [RPG_Group_Tracker]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 3/12/2019 11:25:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[AdminID] [int] NOT NULL,
	[IsAdmin] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Character]    Script Date: 3/12/2019 11:25:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Character](
	[CharacterID] [int] IDENTITY(1,1) NOT NULL,
	[GameTypeID] [int] NOT NULL,
	[PlayerID] [int] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Biography] [text] NULL,
	[PicturePath] [text] NULL,
	[Age] [int] NOT NULL,
 CONSTRAINT [PK_Character] PRIMARY KEY CLUSTERED 
(
	[CharacterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CharacterToRPGGroup]    Script Date: 3/12/2019 11:25:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CharacterToRPGGroup](
	[CharacterID] [int] NOT NULL,
	[GroupID] [int] NOT NULL,
 CONSTRAINT [PK_CharacterToRPGGroup] PRIMARY KEY CLUSTERED 
(
	[CharacterID] ASC,
	[GroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DnD5eArmor]    Script Date: 3/12/2019 11:25:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DnD5eArmor](
	[ArmorID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Type] [nvarchar](50) NULL,
	[Cost] [int] NULL,
	[AC] [nvarchar](50) NULL,
	[StrengthReq] [int] NULL,
	[Weight] [int] NOT NULL,
	[ACBonus] [int] NULL,
	[DisadvantageOnStealth] [bit] NOT NULL,
	[Magical] [bit] NOT NULL,
	[Properties] [text] NULL,
 CONSTRAINT [PK_DnD5eArmor] PRIMARY KEY CLUSTERED 
(
	[ArmorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DnD5eBackground]    Script Date: 3/12/2019 11:25:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DnD5eBackground](
	[BackgroundID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Description] [text] NULL,
	[SkillProfs] [nvarchar](50) NULL,
	[ToolProfs] [nvarchar](50) NULL,
	[Languages] [nvarchar](50) NULL,
	[Equipment] [text] NULL,
	[FeatureName] [nvarchar](50) NULL,
	[FeatureDescription] [text] NULL,
	[SuggestedCharacteristics] [text] NULL,
	[PersonalityTrait] [text] NULL,
	[Ideal] [text] NULL,
	[Bond] [text] NULL,
	[Flaw] [text] NULL,
 CONSTRAINT [PK_DnD5eBackground] PRIMARY KEY CLUSTERED 
(
	[BackgroundID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DnD5eBackgroundToProfSkills]    Script Date: 3/12/2019 11:25:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DnD5eBackgroundToProfSkills](
	[BackgroundID] [int] NOT NULL,
	[SkillID] [int] NOT NULL,
	[IsProf] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DnD5eCharacter]    Script Date: 3/12/2019 11:25:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DnD5eCharacter](
	[CharacterID] [int] IDENTITY(1,1) NOT NULL,
	[GroupID] [int] NULL,
	[RaceID] [int] NOT NULL,
	[SubraceID] [int] NULL,
	[StrengthScore] [int] NOT NULL,
	[DexterityScore] [int] NOT NULL,
	[ConstitutionScore] [int] NOT NULL,
	[CharismaScore] [int] NOT NULL,
	[IntelligenceScore] [int] NOT NULL,
	[WisdomScore] [int] NOT NULL,
	[Alignment] [nvarchar](max) NOT NULL,
	[ProfociencyBonus] [int] NOT NULL,
	[TotalLevel] [int] NOT NULL,
	[CurrentXP] [int] NOT NULL,
	[XPNeededToLevelUp] [int] NOT NULL,
	[StrengthMod] [int] NOT NULL,
	[DexterityMod] [int] NOT NULL,
	[ConstitutionMod] [int] NOT NULL,
	[CharismaMod] [int] NOT NULL,
	[WisdomMod] [int] NOT NULL,
	[IntelligenceMod] [int] NOT NULL,
	[HitPointsTotal] [int] NOT NULL,
	[CurrentHitPoints] [int] NOT NULL,
	[Speed] [int] NOT NULL,
	[PersonalityTraits] [text] NOT NULL,
	[Ideals] [text] NOT NULL,
	[Bonds] [text] NOT NULL,
	[Flaws] [text] NOT NULL,
	[ProficienciesAndLanguages] [nvarchar](max) NOT NULL,
	[Height] [nvarchar](50) NULL,
	[Weight] [nvarchar](50) NULL,
	[Eyes] [nvarchar](50) NULL,
	[Skin] [nvarchar](50) NULL,
	[Hair] [nvarchar](50) NULL,
	[AlliesAndOrganizatons] [text] NULL,
	[GoldAmount] [int] NOT NULL,
	[ElectrumAmount] [int] NOT NULL,
	[SiverAmount] [int] NOT NULL,
	[CopperAmount] [int] NOT NULL,
	[FirstLevelSpellSlots] [int] NOT NULL,
	[SecondLevelSpellSlots] [int] NOT NULL,
	[ThirdLevelSpellSlots] [int] NOT NULL,
	[FourthLevelSpellSlots] [int] NOT NULL,
	[FifthLevelSpellSlots] [int] NOT NULL,
	[SixthLevelSpellSlots] [int] NOT NULL,
	[SeventhLevelSpellSlots] [int] NOT NULL,
	[EighthLevelSpellSlots] [int] NOT NULL,
	[NinthLevelSpellSlots] [int] NOT NULL,
	[SpellsKnown] [int] NOT NULL,
	[CantripsKnown] [int] NOT NULL,
	[BackgroundID] [int] NULL,
 CONSTRAINT [PK_DnD5eCharacter] PRIMARY KEY CLUSTERED 
(
	[CharacterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DnD5eCharacterToArmor]    Script Date: 3/12/2019 11:25:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DnD5eCharacterToArmor](
	[CharacterID] [int] NOT NULL,
	[ArmorID] [int] NOT NULL,
	[IsProficient] [int] NOT NULL,
	[IsWearing] [bit] NULL,
 CONSTRAINT [PK_DnD5eCharacterToArmor] PRIMARY KEY CLUSTERED 
(
	[CharacterID] ASC,
	[ArmorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DnD5eCharacterToClass]    Script Date: 3/12/2019 11:25:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DnD5eCharacterToClass](
	[ClassID] [int] NOT NULL,
	[CharacterID] [int] NOT NULL,
	[ClassLevels] [int] NOT NULL,
 CONSTRAINT [PK_DnD5eCharacterToClass] PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC,
	[CharacterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DnD5eCharacterToFeats]    Script Date: 3/12/2019 11:25:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DnD5eCharacterToFeats](
	[CharacterID] [int] NOT NULL,
	[FeatID] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DnD5eCharacterToItem]    Script Date: 3/12/2019 11:25:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DnD5eCharacterToItem](
	[CharacterID] [int] NULL,
	[ItemID] [int] NULL,
	[Quantity] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DnD5eCharacterToProfSkill]    Script Date: 3/12/2019 11:25:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DnD5eCharacterToProfSkill](
	[CharacterID] [int] NOT NULL,
	[SkillID] [int] NOT NULL,
 CONSTRAINT [PK_DnD5eCharacterToProfSkill] PRIMARY KEY CLUSTERED 
(
	[CharacterID] ASC,
	[SkillID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DnD5eCharacterToSpell]    Script Date: 3/12/2019 11:25:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DnD5eCharacterToSpell](
	[CharacterID] [int] NULL,
	[SpellID] [int] NULL,
	[PreparedSpell] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DnD5eCharacterToWeapons]    Script Date: 3/12/2019 11:25:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DnD5eCharacterToWeapons](
	[CharacterID] [int] NOT NULL,
	[WeaponID] [int] NOT NULL,
	[HasProficiency] [bit] NOT NULL,
	[Quantity] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DnD5eClass]    Script Date: 3/12/2019 11:25:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DnD5eClass](
	[ClassID] [int] IDENTITY(1,1) NOT NULL,
	[ClassName] [nvarchar](50) NOT NULL,
	[ClassDescription] [text] NOT NULL,
	[MulticlassReq] [nvarchar](50) NULL,
	[HitDie] [nvarchar](3) NULL,
	[SavingThrowProfs] [nvarchar](50) NULL,
	[LightArmorProf] [bit] NULL,
	[MediumArmorProf] [bit] NULL,
	[HeavyArmorProf] [bit] NULL,
	[ShieldProf] [bit] NULL,
	[WeaponProfs] [text] NULL,
 CONSTRAINT [PK_DnD5eClass] PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DnD5eClassFeatures]    Script Date: 3/12/2019 11:25:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DnD5eClassFeatures](
	[FeatureID] [int] IDENTITY(1,1) NOT NULL,
	[ClassID] [int] NOT NULL,
	[SubClassID] [int] NULL,
	[RequiredClassLevel] [int] NULL,
	[FeatureName] [nvarchar](50) NULL,
	[FeatureDescription] [text] NOT NULL,
 CONSTRAINT [PK_DnD5eClassFeatures] PRIMARY KEY CLUSTERED 
(
	[FeatureID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DnD5eClassSkillProf]    Script Date: 3/12/2019 11:25:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DnD5eClassSkillProf](
	[ClassID] [int] NOT NULL,
	[SkillID] [int] NOT NULL,
	[HasProficiency] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DnD5eClassToSpell]    Script Date: 3/12/2019 11:25:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DnD5eClassToSpell](
	[ClassID] [int] NOT NULL,
	[SpellID] [int] NOT NULL,
	[ClassLevelNeeded] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DnD5eFeats]    Script Date: 3/12/2019 11:25:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DnD5eFeats](
	[FeatID] [int] IDENTITY(8000,1) NOT NULL,
	[FeatName] [nvarchar](max) NOT NULL,
	[StatPrerequisite] [nvarchar](50) NULL,
	[MagicPrerequisite] [nvarchar](50) NULL,
	[ArmorProfPrerequisite] [nvarchar](50) NULL,
	[FeatDescription] [text] NOT NULL,
 CONSTRAINT [PK_DnD5eFeats] PRIMARY KEY CLUSTERED 
(
	[FeatID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DnD5eItems]    Script Date: 3/12/2019 11:25:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DnD5eItems](
	[ItemID] [int] IDENTITY(1,1) NOT NULL,
	[ItemName] [nvarchar](max) NOT NULL,
	[ItemDescription] [text] NULL,
	[ItemCost] [int] NOT NULL,
	[ItemWeight] [int] NULL,
 CONSTRAINT [PK_DnD5eItems] PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DnD5eRaces]    Script Date: 3/12/2019 11:25:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DnD5eRaces](
	[RaceID] [int] IDENTITY(1,1) NOT NULL,
	[BaseRaceName] [nvarchar](50) NULL,
	[StrengthIncrease] [int] NOT NULL,
	[DexterityIncrease] [int] NOT NULL,
	[ConstitutionIncrease] [int] NOT NULL,
	[WisdomIncrease] [int] NOT NULL,
	[CharismaIncrease] [int] NOT NULL,
	[IntelligenceIncrease] [int] NOT NULL,
	[Languages] [text] NULL,
	[Abilities] [text] NULL,
	[Age] [text] NULL,
	[Alignment] [text] NULL,
	[Size] [text] NULL,
	[Speed] [int] NULL,
 CONSTRAINT [PK_DnD5eRaces] PRIMARY KEY CLUSTERED 
(
	[RaceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DnD5eSkills]    Script Date: 3/12/2019 11:25:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DnD5eSkills](
	[SkillID] [int] IDENTITY(1,1) NOT NULL,
	[SkillName] [nvarchar](50) NOT NULL,
	[BaseStat] [nvarchar](50) NOT NULL,
	[SkillDescription] [text] NULL,
 CONSTRAINT [PK_DnD5eSkills] PRIMARY KEY CLUSTERED 
(
	[SkillID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DnD5eSpells]    Script Date: 3/12/2019 11:25:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DnD5eSpells](
	[SpellID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[School] [nvarchar](50) NULL,
	[CastingTime] [nvarchar](20) NULL,
	[SpellLevel] [int] NOT NULL,
	[Components] [nvarchar](50) NULL,
	[Range] [nchar](10) NOT NULL,
	[SpellMaterials] [nvarchar](max) NULL,
	[SpellDescription] [text] NULL,
	[Duration] [nvarchar](50) NULL,
	[RitualFlag] [bit] NULL,
	[RequiresConcentration] [bit] NULL,
 CONSTRAINT [PK_DnD5eSpells] PRIMARY KEY CLUSTERED 
(
	[SpellID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DnD5eSubclass]    Script Date: 3/12/2019 11:25:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DnD5eSubclass](
	[SubclassID] [int] IDENTITY(1,1) NOT NULL,
	[ClassID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ClassLevelChosen] [int] NULL,
	[Description] [text] NULL,
 CONSTRAINT [PK_DnD5eSubclass] PRIMARY KEY CLUSTERED 
(
	[SubclassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DnD5eSubrace]    Script Date: 3/12/2019 11:25:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DnD5eSubrace](
	[SubraceID] [int] IDENTITY(1,1) NOT NULL,
	[RaceID] [int] NOT NULL,
	[SubraceName] [nvarchar](50) NOT NULL,
	[SubraceDescription] [text] NULL,
	[StrengthIncrease] [int] NOT NULL,
	[DexterityIncrease] [int] NOT NULL,
	[ConstitutionIncrease] [int] NOT NULL,
	[IntelligenceIncrease] [int] NOT NULL,
	[WisdomIncrease] [int] NOT NULL,
	[CharismaIncrease] [int] NOT NULL,
	[SubraceAbilities] [text] NULL,
 CONSTRAINT [PK_DnD5eSubrace] PRIMARY KEY CLUSTERED 
(
	[SubraceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DnD5eWeaponProperties]    Script Date: 3/12/2019 11:25:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DnD5eWeaponProperties](
	[WeaponPropertyID] [int] IDENTITY(1,1) NOT NULL,
	[PropertyName] [nvarchar](50) NOT NULL,
	[PropertyDescription] [text] NULL,
 CONSTRAINT [PK_DnD5eWeaponProperties] PRIMARY KEY CLUSTERED 
(
	[WeaponPropertyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DnD5eWeapons]    Script Date: 3/12/2019 11:25:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DnD5eWeapons](
	[WeaponID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [text] NOT NULL,
	[DamageType] [nvarchar](50) NOT NULL,
	[DamageDice] [nvarchar](50) NOT NULL,
	[AttackBonusStat] [nvarchar](50) NOT NULL,
	[DamageModifier] [int] NOT NULL,
	[IsMagical] [bit] NOT NULL,
	[WeaponType] [nvarchar](50) NOT NULL,
	[Properties] [nvarchar](max) NULL,
	[Weight] [int] NULL,
	[Melee] [bit] NULL,
	[Cost] [int] NULL,
	[Abilities] [text] NULL,
 CONSTRAINT [PK_DnD5eWeapons] PRIMARY KEY CLUSTERED 
(
	[WeaponID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DnD5eWeaponstoProperties]    Script Date: 3/12/2019 11:25:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DnD5eWeaponstoProperties](
	[WeaponID] [int] NOT NULL,
	[WeaponPropertyID] [int] NOT NULL,
 CONSTRAINT [PK_DnD5eWeaponstoProperties] PRIMARY KEY CLUSTERED 
(
	[WeaponID] ASC,
	[WeaponPropertyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ForumPost]    Script Date: 3/12/2019 11:25:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ForumPost](
	[ForumPostID] [int] NOT NULL,
	[ForumTopicID] [int] NOT NULL,
	[ResponsePostID] [int] NULL,
	[Message] [text] NOT NULL,
	[PostDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GameType]    Script Date: 3/12/2019 11:25:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GameType](
	[GameID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Genre] [nvarchar](50) NULL,
	[DiceSystem] [nvarchar](50) NULL,
	[Description] [text] NULL,
 CONSTRAINT [PK_GameType] PRIMARY KEY CLUSTERED 
(
	[GameID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Player]    Script Date: 3/12/2019 11:25:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Player](
	[PlayerID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[Biography] [text] NULL,
	[GamePreferences] [nvarchar](max) NULL,
	[SeekingGroupFor] [nvarchar](max) NULL,
 CONSTRAINT [PK_Player] PRIMARY KEY CLUSTERED 
(
	[PlayerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlayerInGroup]    Script Date: 3/12/2019 11:25:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlayerInGroup](
	[PlayerID] [int] NOT NULL,
	[GroupID] [int] NOT NULL,
	[IsGM] [bit] NOT NULL,
	[JoinDate] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RPGGroup]    Script Date: 3/12/2019 11:25:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RPGGroup](
	[GroupID] [int] IDENTITY(1,1) NOT NULL,
	[GameMasterID] [int] NOT NULL,
	[GameTypeID] [int] NOT NULL,
	[GroupTitle] [nvarchar](50) NOT NULL,
	[MaxPlayers] [int] NOT NULL,
	[CurrentPlayerCount] [int] NOT NULL,
	[NextSessionScheduledStart] [datetime] NULL,
	[NextSessionScheduledEndTime] [datetime] NULL,
	[NumberOfSessions] [int] NOT NULL,
	[CreationDate] [datetime] NULL,
 CONSTRAINT [PK_RPGGroup] PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserPermissions]    Script Date: 3/12/2019 11:25:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserPermissions](
	[UserID] [int] NOT NULL,
	[IsAdmin] [bit] NOT NULL,
	[CanSeeAllGroups] [bit] NOT NULL,
	[DashboardAccess] [bit] NOT NULL,
	[CanSeeAllCharacters] [bit] NOT NULL,
	[CanSeeAllCharactersInGroup] [bit] NOT NULL,
	[CanEditAllCharacters] [bit] NOT NULL,
	[CanEditAllCharactersInGroup] [bit] NOT NULL,
	[CanScheduleGroup] [bit] NOT NULL,
	[CanSendSitewideEmail] [bit] NOT NULL,
	[CanChangeCharacterOwnership] [bit] NOT NULL,
	[CanDeleteUsers] [bit] NOT NULL,
	[CanRemovePlayerFromGroup] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 3/12/2019 11:25:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[EmailAddress] [nvarchar](50) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[PhoneNumber] [nvarchar](25) NOT NULL,
	[Gender] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[Age] [int] NULL,
	[DOB] [datetime] NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Salt] [nvarchar](50) NULL,
	[Role] [nvarchar](50) NULL,
	[ProfilePicturePath] [nvarchar](max) NOT NULL,
	[CreationDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Character] ON 

INSERT [dbo].[Character] ([CharacterID], [GameTypeID], [PlayerID], [Name], [Biography], [PicturePath], [Age]) VALUES (1, 1, 1, N'Ezalor the Mad Mage', N'This is a Bio', NULL, 80)
INSERT [dbo].[Character] ([CharacterID], [GameTypeID], [PlayerID], [Name], [Biography], [PicturePath], [Age]) VALUES (2, 1, 1, N'Yuri the Bea Barbarian', N'Also a Bio', NULL, 20)
INSERT [dbo].[Character] ([CharacterID], [GameTypeID], [PlayerID], [Name], [Biography], [PicturePath], [Age]) VALUES (3, 1, 1, N'Tommy Ray Handly', N'Hey Look! A Bio', NULL, 25)
SET IDENTITY_INSERT [dbo].[Character] OFF
SET IDENTITY_INSERT [dbo].[DnD5eArmor] ON 

INSERT [dbo].[DnD5eArmor] ([ArmorID], [Name], [Type], [Cost], [AC], [StrengthReq], [Weight], [ACBonus], [DisadvantageOnStealth], [Magical], [Properties]) VALUES (1, N'Padded', N'Light', 500, N'11 + Dex modifier ', NULL, 8, NULL, 1, 0, N'Padded arm or consists of quilted layers of
cloth and batting.')
INSERT [dbo].[DnD5eArmor] ([ArmorID], [Name], [Type], [Cost], [AC], [StrengthReq], [Weight], [ACBonus], [DisadvantageOnStealth], [Magical], [Properties]) VALUES (3, N'Leather', N'Light', 1000, N' 11 + Dex modifier', NULL, 10, NULL, 0, 0, N'Leather. The breastplate and shoulder protectors of
this arm or are made of leather that has been stiffened
by being boiled in oil. The rest of the arm or is made of
softer and m ore flexible materials.')
INSERT [dbo].[DnD5eArmor] ([ArmorID], [Name], [Type], [Cost], [AC], [StrengthReq], [Weight], [ACBonus], [DisadvantageOnStealth], [Magical], [Properties]) VALUES (6, N'Studded Leather', N'Light', 4500, N'12', NULL, 13, NULL, 0, 0, N'Made from tough but flexible
leather, studded leather is reinforced with close-set
rivets or spikes.')
INSERT [dbo].[DnD5eArmor] ([ArmorID], [Name], [Type], [Cost], [AC], [StrengthReq], [Weight], [ACBonus], [DisadvantageOnStealth], [Magical], [Properties]) VALUES (7, N'Hide', N'Medium', 1000, N'12 + Dex modifier (max 2)', NULL, 12, NULL, 0, 0, N'This crude arm or consists o f thick furs and
pelts. It is com m only w orn by barbarian tribes, evil
humanoids, and other folk w ho lack access to the tools
and materials needed to create better armor')
INSERT [dbo].[DnD5eArmor] ([ArmorID], [Name], [Type], [Cost], [AC], [StrengthReq], [Weight], [ACBonus], [DisadvantageOnStealth], [Magical], [Properties]) VALUES (8, N'Chain Shirt', N'Medium', 5000, N'13 + Dex modifier (max 2) ', NULL, 20, NULL, 0, 0, N'M ade of interlocking metal rings, a chain
shirt is w orn betw een layers o f clothing or leather. This
arm or offers m odest protection to the w earer’s upper
body and allows the sound of the rings rubbing against
one another to be muffled by outer layers')
INSERT [dbo].[DnD5eArmor] ([ArmorID], [Name], [Type], [Cost], [AC], [StrengthReq], [Weight], [ACBonus], [DisadvantageOnStealth], [Magical], [Properties]) VALUES (9, N'Ring Mail', N'Heavy', 3000, N'14', NULL, 40, NULL, 0, 0, N'This armor is leather arm or with heavy
rings sew n into it. The rings help reinforce the armor
against blows from sw ords and axes. Ring mail is
inferior to chain mail, and it''s usually w orn only by those
w ho can’t afford better armor.')
INSERT [dbo].[DnD5eArmor] ([ArmorID], [Name], [Type], [Cost], [AC], [StrengthReq], [Weight], [ACBonus], [DisadvantageOnStealth], [Magical], [Properties]) VALUES (11, N'Plate', N'Heavy', 150000, N'18', 15, 60, NULL, 1, 0, N' Plate consists o f shaped, interlocking metal
plates to cover the entire body. A suit of plate includes
gauntlets, heavy leather boots, a visored helmet, and
thick layers of padding underneath the armor. Buckles
and straps distribute the weight over the body.')
INSERT [dbo].[DnD5eArmor] ([ArmorID], [Name], [Type], [Cost], [AC], [StrengthReq], [Weight], [ACBonus], [DisadvantageOnStealth], [Magical], [Properties]) VALUES (12, N'Shield', N'Shield', 1000, N'+2', NULL, 6, NULL, 0, 0, N'A shield is made from w ood or metal and
is carried in one hand. W ielding a shield increases
your A rm or Class by 2. You can benefit from only one
shield at a time.')
SET IDENTITY_INSERT [dbo].[DnD5eArmor] OFF
SET IDENTITY_INSERT [dbo].[DnD5eBackground] ON 

INSERT [dbo].[DnD5eBackground] ([BackgroundID], [Name], [Description], [SkillProfs], [ToolProfs], [Languages], [Equipment], [FeatureName], [FeatureDescription], [SuggestedCharacteristics], [PersonalityTrait], [Ideal], [Bond], [Flaw]) VALUES (1, N'Acolyte', N'You have spent your life in the service of a temple
to a specific god or pantheon of gods. You act as an
intermediary between the realm of the holy and the
mortal world, perform ing sacred rites and offering
sacrifices in order to conduct w orshipers into the
presence of the divine. You are not necessarily a
cleric-p erform in g sacred rites is not the sam e thing as
channeling divine power.
C hoose a god, a pantheon of gods, or som e other
quasi-divine being from am ong those listed in appendix
B or those specified by your DM, and work with your
DM to detail the nature of your religious service.
W ere you a lesser functionary in a temple, raised from
childhood to assist the priests in the sacred rites? Or
were you a high priest w ho suddenly experienced a call
to serve your god in a different way? Perhaps you were
the leader of a small cult outside of any established
temple structure, or even an occult group that served a
fiendish master that you now deny.', N'Insight, Religion ', NULL, N'Languages: Two o f your choice ', N'Equipment: A holy sym bol (a gift to you w hen you
entered the priesthood), a prayer book or prayer
wheel, 5 sticks of incense, vestments, a set of com m on
clothes, and a belt pouch containing 15 gp', N'Shelter of the Faithful', N'As an acolyte, you com m and the respect of those who
share your faith, and you can perform the religious
cerem onies of your deity. You and your adventuring
com panions can expect to receive free healing and
care at a temple, shrine, or other established presence
of your faith, though you must provide any material
com ponents needed for spells. T hose w ho share
your religion will support you (but only you) at a
m odest lifestyle.
You might also have ties to a specific temple dedicated
to your chosen deity or pantheon, and you have a
residence there. This could be the temple where you
used to serve, if you remain on good terms with it, or a
temple where you have found a new hom e. W hile near
your temple, you can call upon the priests for assistance,
provided the assistance you ask for is not hazardous and
you remain in good standing with your temple.', N'Acolytes are shaped by their experience in temples
or other religious com m unities. Their study of the
history and tenets of their faith and their relationships
to temples, shrines, or hierarchies affect their
m annerism s and ideals. Their flaws might be som e
hidden hypocrisy or heretical idea, or an ideal or bond
taken to an extreme.', N'd8 Personality Trait
1 I idolize a particular hero of my faith, and constantly
refer to that person’s deeds and example.
3 I see omens in every event and action. The gods try to
speak to us, we just need to listen
4 Nothing can shake my optimistic attitude.
5 I quote (or misquote) sacred texts and proverbs in
almost every situation.
6 I am tolerant (or intolerant) of other faiths and respect
(or condemn) the worship of other gods.
7 I''ve enjoyed fine food, drink, and high society among
my temple’s elite. Rough living grates on me.
8 I’ve spent so long in the temple that I have little
practical experience dealing with people in the outside
world.', N'd6 Ideal
1 Tradition. The ancient traditions of worship and
sacrifice must be preserved and upheld. (Lawful)
2 Charity. I always try to help those in need, no matter
what the personal cost. (Good)
3 Change. We must help bring about the changes the
gods are constantly working in the world. (Chaotic)
4 Power. I hope to one day rise to the top of my faith’s
religious hierarchy. (Lawful)
5 Faith. I trust that my deity will guide my actions, I have
faith that if I work hard, things will go well. (Lawful)
6 Aspiration. I seek to prove myself worthy of my god’s
favor by matching my actions against his or her
teachings. (Any)', N'd6 Bond
1 I would die to recover an ancient relic of my faith that
was lost long ago.
2 I will someday get revenge on the corrupt temple
hierarchy who branded me a heretic.
3 I owe my life to the priest who took me in when my
parents died.
4 Everything I do is for the common people.
5 I will do anything to protect the temple where I served.
6 I seek to preserve a sacred text that my enemies
consider heretical and seek to destroy.', N'd6 Flaw
1 I judge others harshly, and myself even more severely.
2 I put too much trust in those who wield power within
my temple’s hierarchy.
3 My piety sometimes leads me to blindly trust those
that profess faith in my god.
4 I am inflexible in my thinking.
5 I am suspicious of strangers and expect the worst of
them.
6 Once I pick a goal, I become obsessed with it to the
detriment of everything else in my life.')
INSERT [dbo].[DnD5eBackground] ([BackgroundID], [Name], [Description], [SkillProfs], [ToolProfs], [Languages], [Equipment], [FeatureName], [FeatureDescription], [SuggestedCharacteristics], [PersonalityTrait], [Ideal], [Bond], [Flaw]) VALUES (2, N'Charlatan', N'You have always had a way with people. You know
what m akes them tick, you can tease out their hearts''
desires after a few minutes of conversation, and with a
few leading questions you can read them like they were
children''s books. It’s a useful talent, and one that you’re
perfectly willing to use for your advantage.
You know what people want and you deliver, or rather,
you prom ise to deliver. Com m on sense should steer
people away from things that sound too good to be true,
but com m on sense seem s to be in short supply when
you’re around. The bottle of pink-colored liquid will
surely cure that unseem ly rash, this ointment—nothing
m ore than a bit o f fat with a sprinkle of silver dust—can
restore youth and vigor, and there’s a bridge in the city
that just happens to be for sale. These marvels sound
implausible, but you make them sound like the real deal.', N' Deception, Sleight of Hand ', NULL, NULL, N'Equipment: A set of fine clothes, a disguise kit, tools
o f the con o f your choice (ten stoppered bottles filled
with colored liquid, a set o f weighted dice, a deck of
marked cards, or a signet ring of an imaginary duke),
and a belt pouch containing 15 gp', N'False Identity', N'You have created a second identity that includes
documentation, established acquaintances, and
disguises that allow you to assume that persona.
Additionally, you can forge docum ents including official
papers and personal letters, as long as you have seen an
example of the kind of docum ent or the handwriting you
are trying to copy.', N'Charlatans are colorful characters w ho conceal their
true selves behind the m asks they construct. They
reflect what people want to see, what they want to
believe, and how they see the world. But their true
selves are som etim es plagued by an uneasy conscience,
an old enemy, or deep-seated trust issues.', N'd8 Personality Trait
1 I fall in and out of love easily, and am always pursuing
someone.
2 I have a joke for every occasion, especially occasions
where humor is inappropriate.
3 Flattery is my preferred trick for getting what I want.
4 I’m a born gambler who can''t resist taking a risk for a
potential payoff.
5 I lie about almost everything, even when there’s no
good reason to.
6 Sarcasm and insults are my weapons of choice.
7 I keep multiple holy symbols on me and invoke
whatever deity might come in useful at any given
moment.
8 I pocket anything I see that might have some value', N'd6 Ideal
1 Independence. I am a free spirit— no one tells me what
to do. (Chaotic)
2 Fairness. I never target people who can’t afford to lose
a few coins. (Lawful)
3 Charity. I distribute the money I acquire to the people
who really need it. (Good)
4 Creativity. I never run the same con twice. (Chaotic)
5 Friendship. Material goods come and go. Bonds of
friendship last forever. (Good)
6 Aspiration. I’m determined to make something
of myself. (Any)', N'd6 Bond
1 I fleeced the wrong person and must work to ensure
that this individual never crosses paths with me or
those I care about.
2 I owe everything to my mentor— a horrible person
who’s probably rotting in jail somewhere.
3 Somewhere out there, I have a child who doesn’t
know me. I’m making the world better for him or her.
4 I come from a noble family, and one day I’ll reclaim my
lands and title from those who stole them from me.
5 A powerful person killed someone I love. Some day
soon, I’ll have my revenge.
6 I swindled and ruined a person who didn’t deserve it. I
seek to atone for my misdeeds but might never be able
to forgive myself.', N'd6 Flaw
1 I can’t resist a pretty face.
2 I''m always in debt. I spend my ill-gotten gains on
decadent luxuries faster than I bring them in..
3 I’m convinced that no one could ever fool me the way
I fool others.
4 I’m too greedy for my own good. I can’t resist taking a
risk if there’s money involved.
5 I can’t resist swindling people who are more powerful
than me.
6 I hate to admit it and will hate myself for it, but I''ll run
and preserve my own hide if the going gets tough.')
INSERT [dbo].[DnD5eBackground] ([BackgroundID], [Name], [Description], [SkillProfs], [ToolProfs], [Languages], [Equipment], [FeatureName], [FeatureDescription], [SuggestedCharacteristics], [PersonalityTrait], [Ideal], [Bond], [Flaw]) VALUES (3, N'Criminal', N'You are an experienced crim inal with a history of
breaking the law. You have spent a lot o f time am ong
other crim inals and still have contacts within the
criminal underworld. You’re far closer than m ost people
to the world of murder, theft, and violence that pervades
the underbelly of civilization, and you have survived up to
this point by flouting the rules and regulations of society.', N' Deception, Stealth ', N': One type of gaming set,
thieves’ tools', NULL, N' A crowbar, a set of dark com m on clothes
including a hood, and a belt pouch containing 15 gp', N'Criminal Contact', N'You have a reliable and trustworthy contact w ho acts as
your liaison to a network o f other criminals. You know
how to get m essages to and from your contact, even
over great distances; specifically, you know the local
m essengers, corrupt caravan masters, and seedy sailors
w ho can deliver m essages for you.', N'Criminals might seem like villains on the surface,
and many of them are villainous to the core. But som e
have an abundance o f endearing, if not redeeming,
characteristics. There might be honor am ong thieves, but
crim inals rarely show any respect for law or authority.', N'd8 Personality Trait
4 I would rather make a new friend than a new enemy.
8 I blow up at the slightest insult.', N'd6 Ideal
1 Honor. I don’t steal from others in the trade. (Lawful)
2 Freedom. Chains are meant to be broken, as are those
who would forge them. (Chaotic)
3 Charity. I steal from the wealthy so that I can help
people in need. (Good)
4 Greed. I will do whatever it takes to become
wealthy. (Evil)
5 People. I’m loyal to my friends, not to any ideals, and
everyone else can take a trip down the Styx for all I
care. (Neutral)
6 Redemption. There’s a spark of good in everyone.
(Good)', N'd6 Bond
1 I’m trying to pay off an old debt I owe to a generous
benefactor.
2 My ill-gotten gains go to support my family.
3 Something important was taken from me, and I aim to
steal it back.
4 I will become the greatest thief that ever lived.
5 I’m guilty of a terrible crime. I hope I can redeem
myself for it.
6 Someone I loved died because of a mistake I made.
That will never happen again.', N'd6 Flaw
1 When I see something valuable, I can’t think about
anything but how to steal it.
2 When faced with a choice between money and my
friends, I usually choose the money.
3 If there’s a plan, I’ll forget it. If I don’t forget it, I’ll
ignore it.
4 I have a “tell” that reveals when I''m lying.
5 I turn tail and run when things look bad.
6 An innocent person is in prison for a crime that I
committed. I’m okay with that')
SET IDENTITY_INSERT [dbo].[DnD5eBackground] OFF
SET IDENTITY_INSERT [dbo].[DnD5eCharacter] ON 

INSERT [dbo].[DnD5eCharacter] ([CharacterID], [GroupID], [RaceID], [SubraceID], [StrengthScore], [DexterityScore], [ConstitutionScore], [CharismaScore], [IntelligenceScore], [WisdomScore], [Alignment], [ProfociencyBonus], [TotalLevel], [CurrentXP], [XPNeededToLevelUp], [StrengthMod], [DexterityMod], [ConstitutionMod], [CharismaMod], [WisdomMod], [IntelligenceMod], [HitPointsTotal], [CurrentHitPoints], [Speed], [PersonalityTraits], [Ideals], [Bonds], [Flaws], [ProficienciesAndLanguages], [Height], [Weight], [Eyes], [Skin], [Hair], [AlliesAndOrganizatons], [GoldAmount], [ElectrumAmount], [SiverAmount], [CopperAmount], [FirstLevelSpellSlots], [SecondLevelSpellSlots], [ThirdLevelSpellSlots], [FourthLevelSpellSlots], [FifthLevelSpellSlots], [SixthLevelSpellSlots], [SeventhLevelSpellSlots], [EighthLevelSpellSlots], [NinthLevelSpellSlots], [SpellsKnown], [CantripsKnown], [BackgroundID]) VALUES (1, 1, 1, 3, 12, 18, 16, 20, 12, 14, N'CN', 3, 5, 6500, 14400, 1, 4, 3, 5, 2, 1, 37, 20, 30, N'Chaotic', N'Really likes Chaos', N'No Bonds', N'No flaws', N'Cooking ', N'63', N'120', N'White', N'Pale', N'White/Gray', N'None', 5, 5, 2, 1, 4, 3, 2, 0, 0, 0, 0, 0, 0, 7, 5, 1)
INSERT [dbo].[DnD5eCharacter] ([CharacterID], [GroupID], [RaceID], [SubraceID], [StrengthScore], [DexterityScore], [ConstitutionScore], [CharismaScore], [IntelligenceScore], [WisdomScore], [Alignment], [ProfociencyBonus], [TotalLevel], [CurrentXP], [XPNeededToLevelUp], [StrengthMod], [DexterityMod], [ConstitutionMod], [CharismaMod], [WisdomMod], [IntelligenceMod], [HitPointsTotal], [CurrentHitPoints], [Speed], [PersonalityTraits], [Ideals], [Bonds], [Flaws], [ProficienciesAndLanguages], [Height], [Weight], [Eyes], [Skin], [Hair], [AlliesAndOrganizatons], [GoldAmount], [ElectrumAmount], [SiverAmount], [CopperAmount], [FirstLevelSpellSlots], [SecondLevelSpellSlots], [ThirdLevelSpellSlots], [FourthLevelSpellSlots], [FifthLevelSpellSlots], [SixthLevelSpellSlots], [SeventhLevelSpellSlots], [EighthLevelSpellSlots], [NinthLevelSpellSlots], [SpellsKnown], [CantripsKnown], [BackgroundID]) VALUES (2, 1, 2, NULL, 18, 16, 16, 8, 10, 8, N'CG', 2, 1, 0, 1000, 4, 3, 3, -1, -1, 0, 16, 16, 35, N'Russian', N'Likes Bears', N'Bears', N'Stupid', N'Cooking, Whittling', N'75', N'250', N'Blue', N'Olive', N'Red', N'None', 10, 50, 2, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3)
INSERT [dbo].[DnD5eCharacter] ([CharacterID], [GroupID], [RaceID], [SubraceID], [StrengthScore], [DexterityScore], [ConstitutionScore], [CharismaScore], [IntelligenceScore], [WisdomScore], [Alignment], [ProfociencyBonus], [TotalLevel], [CurrentXP], [XPNeededToLevelUp], [StrengthMod], [DexterityMod], [ConstitutionMod], [CharismaMod], [WisdomMod], [IntelligenceMod], [HitPointsTotal], [CurrentHitPoints], [Speed], [PersonalityTraits], [Ideals], [Bonds], [Flaws], [ProficienciesAndLanguages], [Height], [Weight], [Eyes], [Skin], [Hair], [AlliesAndOrganizatons], [GoldAmount], [ElectrumAmount], [SiverAmount], [CopperAmount], [FirstLevelSpellSlots], [SecondLevelSpellSlots], [ThirdLevelSpellSlots], [FourthLevelSpellSlots], [FifthLevelSpellSlots], [SixthLevelSpellSlots], [SeventhLevelSpellSlots], [EighthLevelSpellSlots], [NinthLevelSpellSlots], [SpellsKnown], [CantripsKnown], [BackgroundID]) VALUES (3, 2, 2, 6, 16, 16, 14, 14, 8, 10, N'CG', 2, 1, 0, 1000, 3, 3, 2, 2, 0, -1, 12, 12, 35, N'Aristocratic', N'Only a Noble Man can lead the masses', N'Ancestral Home', N'Arrogance', N'Lute, Card Playing, Common ', N'69', N'220', N'Brown', N'Tanned', N'Black', N'None', 20, 0, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2)
SET IDENTITY_INSERT [dbo].[DnD5eCharacter] OFF
INSERT [dbo].[DnD5eCharacterToClass] ([ClassID], [CharacterID], [ClassLevels]) VALUES (1, 2, 1)
INSERT [dbo].[DnD5eCharacterToClass] ([ClassID], [CharacterID], [ClassLevels]) VALUES (6, 3, 1)
INSERT [dbo].[DnD5eCharacterToClass] ([ClassID], [CharacterID], [ClassLevels]) VALUES (12, 1, 2)
INSERT [dbo].[DnD5eCharacterToFeats] ([CharacterID], [FeatID]) VALUES (3, 9007)
INSERT [dbo].[DnD5eCharacterToFeats] ([CharacterID], [FeatID]) VALUES (2, 8007)
INSERT [dbo].[DnD5eCharacterToItem] ([CharacterID], [ItemID], [Quantity]) VALUES (1, 1, 1)
INSERT [dbo].[DnD5eCharacterToItem] ([CharacterID], [ItemID], [Quantity]) VALUES (1, 3, 5)
INSERT [dbo].[DnD5eCharacterToItem] ([CharacterID], [ItemID], [Quantity]) VALUES (1, 4, 2)
INSERT [dbo].[DnD5eCharacterToItem] ([CharacterID], [ItemID], [Quantity]) VALUES (1, 6, 2)
INSERT [dbo].[DnD5eCharacterToItem] ([CharacterID], [ItemID], [Quantity]) VALUES (1, 7, 1)
INSERT [dbo].[DnD5eCharacterToItem] ([CharacterID], [ItemID], [Quantity]) VALUES (2, 4, 1)
INSERT [dbo].[DnD5eCharacterToItem] ([CharacterID], [ItemID], [Quantity]) VALUES (2, 17, 1)
INSERT [dbo].[DnD5eCharacterToItem] ([CharacterID], [ItemID], [Quantity]) VALUES (2, 18, 1)
INSERT [dbo].[DnD5eCharacterToItem] ([CharacterID], [ItemID], [Quantity]) VALUES (2, 28, 1)
INSERT [dbo].[DnD5eCharacterToItem] ([CharacterID], [ItemID], [Quantity]) VALUES (2, 29, 1)
INSERT [dbo].[DnD5eCharacterToItem] ([CharacterID], [ItemID], [Quantity]) VALUES (2, 30, 2)
INSERT [dbo].[DnD5eCharacterToItem] ([CharacterID], [ItemID], [Quantity]) VALUES (3, 30, 5)
INSERT [dbo].[DnD5eCharacterToItem] ([CharacterID], [ItemID], [Quantity]) VALUES (3, 21, 5)
INSERT [dbo].[DnD5eCharacterToItem] ([CharacterID], [ItemID], [Quantity]) VALUES (3, 26, 1)
INSERT [dbo].[DnD5eCharacterToItem] ([CharacterID], [ItemID], [Quantity]) VALUES (3, 22, 1)
INSERT [dbo].[DnD5eCharacterToItem] ([CharacterID], [ItemID], [Quantity]) VALUES (3, 23, 1)
INSERT [dbo].[DnD5eCharacterToItem] ([CharacterID], [ItemID], [Quantity]) VALUES (3, 11, 1)
INSERT [dbo].[DnD5eCharacterToProfSkill] ([CharacterID], [SkillID]) VALUES (1, 3)
INSERT [dbo].[DnD5eCharacterToProfSkill] ([CharacterID], [SkillID]) VALUES (1, 5)
INSERT [dbo].[DnD5eCharacterToProfSkill] ([CharacterID], [SkillID]) VALUES (1, 11)
INSERT [dbo].[DnD5eCharacterToProfSkill] ([CharacterID], [SkillID]) VALUES (1, 13)
INSERT [dbo].[DnD5eCharacterToProfSkill] ([CharacterID], [SkillID]) VALUES (1, 15)
INSERT [dbo].[DnD5eCharacterToProfSkill] ([CharacterID], [SkillID]) VALUES (1, 18)
INSERT [dbo].[DnD5eCharacterToProfSkill] ([CharacterID], [SkillID]) VALUES (2, 1)
INSERT [dbo].[DnD5eCharacterToProfSkill] ([CharacterID], [SkillID]) VALUES (2, 13)
INSERT [dbo].[DnD5eCharacterToProfSkill] ([CharacterID], [SkillID]) VALUES (2, 14)
INSERT [dbo].[DnD5eCharacterToProfSkill] ([CharacterID], [SkillID]) VALUES (2, 16)
INSERT [dbo].[DnD5eCharacterToProfSkill] ([CharacterID], [SkillID]) VALUES (3, 1)
INSERT [dbo].[DnD5eCharacterToProfSkill] ([CharacterID], [SkillID]) VALUES (3, 2)
INSERT [dbo].[DnD5eCharacterToProfSkill] ([CharacterID], [SkillID]) VALUES (3, 6)
INSERT [dbo].[DnD5eCharacterToProfSkill] ([CharacterID], [SkillID]) VALUES (3, 18)
INSERT [dbo].[DnD5eCharacterToWeapons] ([CharacterID], [WeaponID], [HasProficiency], [Quantity]) VALUES (1, 8, 1, 1)
INSERT [dbo].[DnD5eCharacterToWeapons] ([CharacterID], [WeaponID], [HasProficiency], [Quantity]) VALUES (1, 15, 1, 1)
INSERT [dbo].[DnD5eCharacterToWeapons] ([CharacterID], [WeaponID], [HasProficiency], [Quantity]) VALUES (1, 17, 1, 1)
INSERT [dbo].[DnD5eCharacterToWeapons] ([CharacterID], [WeaponID], [HasProficiency], [Quantity]) VALUES (2, 11, 1, 1)
INSERT [dbo].[DnD5eCharacterToWeapons] ([CharacterID], [WeaponID], [HasProficiency], [Quantity]) VALUES (2, 9, 1, 1)
INSERT [dbo].[DnD5eCharacterToWeapons] ([CharacterID], [WeaponID], [HasProficiency], [Quantity]) VALUES (3, 10, 1, 10)
INSERT [dbo].[DnD5eCharacterToWeapons] ([CharacterID], [WeaponID], [HasProficiency], [Quantity]) VALUES (3, 18, 1, 1)
SET IDENTITY_INSERT [dbo].[DnD5eClass] ON 

INSERT [dbo].[DnD5eClass] ([ClassID], [ClassName], [ClassDescription], [MulticlassReq], [HitDie], [SavingThrowProfs], [LightArmorProf], [MediumArmorProf], [HeavyArmorProf], [ShieldProf], [WeaponProfs]) VALUES (1, N'Barbarian', N'A tall human tribesman strides through a blizzard,
draped in fur and hefting his axe. He laughs as he
charges toward the frost giant w ho dared poach his
people’s elk herd.
A half-orc snarls at the latest challenger to her
authority over their savage tribe, ready to break his neck
with her bare hands as she did to the last six rivals.
Frothing at the mouth, a dw arf slam s his helmet into
the face of his drow foe, then turns to drive his armored
elbow into the gut o f another.
These barbarians, different as they might be, are
defined by their rage: unbridled, unquenchable, and
unthinking fury. M ore than a mere emotion, their anger
is the ferocity of a cornered predator, the unrelenting
assault of a storm, the churning turmoil o f the sea.
For som e, their rage springs from a com m union
with fierce animal spirits. Others draw from a roiling
reservoir of anger at a world full of pain. For every
barbarian, rage is a pow er that fuels not just a battle
frenzy but also uncanny reflexes, resilience, and
feats of strength.
P r i m a l I n s t i n c t
People of towns and cities take pride in how their
civilized ways set them apart from animals, as if
denying one’s ow n nature w as a mark o f superiority. To
a barbarian, though, civilization is no virtue, but a sign
of w eakness. The strong em brace their animal n atu rekeen instincts, primal physicality, and ferocious rage.
Barbarians are uncom fortable when hedged in by walls
and crow ds. They thrive in the w ilds o f their homelands:
the tundra, jungle, or grasslands w here their tribes
live and hunt.
Barbarians com e alive in the chaos of combat.
They can enter a berserk state where rage takes over,
giving them superhuman strength and resilience. A
barbarian can draw on this reservoir of fury only a few
times without resting, but those few rages are usually
sufficient to defeat whatever threats arise.
A L i f e o f D a n g e r
Not every m em ber of the tribes deem ed “barbarians”
by scions of civilized society has the barbarian class. A
true barbarian am ong these people is as uncom m on as
a skilled fighter in a town, and he or she plays a similar
role as a protector of the people and a leader in times
of war. Life in the wild places of the w orld is fraught
with peril: rival tribes, deadly weather, and terrifying
monsters. Barbarians charge headlong into that danger
so that their people don’t have to.
Their courage in the face of danger m akes barbarians
perfectly suited for adventuring. W andering is often a
way of life for their native tribes, and the rootless life of
the adventurer is little hardship for a barbarian. Som e
barbarians m iss the close-knit family structures of the
tribe, but eventually find them replaced by the bonds
formed am ong the m em bers of their adventuring parties.', NULL, N'd12', N'Strength,Constiution', 1, 1, 0, 1, N'Simple,Martial')
INSERT [dbo].[DnD5eClass] ([ClassID], [ClassName], [ClassDescription], [MulticlassReq], [HitDie], [SavingThrowProfs], [LightArmorProf], [MediumArmorProf], [HeavyArmorProf], [ShieldProf], [WeaponProfs]) VALUES (2, N'Bard', N'An inspiring magician whose power
echoes the music of creation', NULL, N'd8', N'Dexterity,Charisma', 1, 0, 0, 0, N'Simple Weapons, Hand Crossbows, longswords, rapiers, shortswords')
INSERT [dbo].[DnD5eClass] ([ClassID], [ClassName], [ClassDescription], [MulticlassReq], [HitDie], [SavingThrowProfs], [LightArmorProf], [MediumArmorProf], [HeavyArmorProf], [ShieldProf], [WeaponProfs]) VALUES (3, N'Cleric', N'A priestly champion who wields divine
magic in service of a higher power', NULL, N'd8', N'Wisdom,Charisma', 1, 1, 0, 1, N'Simple Weapons')
INSERT [dbo].[DnD5eClass] ([ClassID], [ClassName], [ClassDescription], [MulticlassReq], [HitDie], [SavingThrowProfs], [LightArmorProf], [MediumArmorProf], [HeavyArmorProf], [ShieldProf], [WeaponProfs]) VALUES (4, N'Druid', N'A priest of the Old Faith, wielding the
powers of nature— moonlight and
plant growth, fire and lightning— and
adopting animal forms', NULL, N'd8', N'Intelligence,Wisdom', 1, 1, 0, 1, N' clubs, daggers,
darts, javelins, maces, quarterstaffs,
scimitars, sickles, slings, spears')
INSERT [dbo].[DnD5eClass] ([ClassID], [ClassName], [ClassDescription], [MulticlassReq], [HitDie], [SavingThrowProfs], [LightArmorProf], [MediumArmorProf], [HeavyArmorProf], [ShieldProf], [WeaponProfs]) VALUES (5, N'Fighter', N'A master of martial combat, skilled with
a variety of weapons and armor', NULL, N'd10', N'Strength,Constitution', 1, 1, 1, 1, N'Simple Weapons, Martial Weapons')
INSERT [dbo].[DnD5eClass] ([ClassID], [ClassName], [ClassDescription], [MulticlassReq], [HitDie], [SavingThrowProfs], [LightArmorProf], [MediumArmorProf], [HeavyArmorProf], [ShieldProf], [WeaponProfs]) VALUES (6, N'Monk', N' An master of martial arts, harnessing
the power of the body in pursuit of
physical and spiritual perfection', NULL, N'd8', N'Dexterity,Wisdom', 0, 0, 0, 0, N'Simple Weapons, shortswords')
INSERT [dbo].[DnD5eClass] ([ClassID], [ClassName], [ClassDescription], [MulticlassReq], [HitDie], [SavingThrowProfs], [LightArmorProf], [MediumArmorProf], [HeavyArmorProf], [ShieldProf], [WeaponProfs]) VALUES (7, N'Paladin', N'A holy warrior bound to a sacred oath', NULL, N'd10', N'Wisdom,Charisma', 1, 1, 1, 1, N'Simple Weapons, Martial Weapons')
INSERT [dbo].[DnD5eClass] ([ClassID], [ClassName], [ClassDescription], [MulticlassReq], [HitDie], [SavingThrowProfs], [LightArmorProf], [MediumArmorProf], [HeavyArmorProf], [ShieldProf], [WeaponProfs]) VALUES (8, N'Ranger', N'A warrior who uses martial prowess and
nature magic to combat threats on the
edges of civilization', NULL, N'd10', N'Dexterity,Wisdom', 1, 1, 0, 1, N'Simple Weapons, Martial Weapons')
INSERT [dbo].[DnD5eClass] ([ClassID], [ClassName], [ClassDescription], [MulticlassReq], [HitDie], [SavingThrowProfs], [LightArmorProf], [MediumArmorProf], [HeavyArmorProf], [ShieldProf], [WeaponProfs]) VALUES (9, N'Rogue', N'A scoundrel who uses stealth and
trickery to overcome obstacles and
enemies', NULL, N'd8', N'Dexterity,Intelligence', 1, 0, 0, 0, N' simple weapons, hand
crossbows, longswords, rapiers,
shortswords')
INSERT [dbo].[DnD5eClass] ([ClassID], [ClassName], [ClassDescription], [MulticlassReq], [HitDie], [SavingThrowProfs], [LightArmorProf], [MediumArmorProf], [HeavyArmorProf], [ShieldProf], [WeaponProfs]) VALUES (10, N'Sorceror', N'A spellcaster who draws on inherent
magic from a gift or bloodline', NULL, N'd6', N'Charisma,Constitution', 0, 0, 0, 0, N'Daggers, darts, slings, quarterstaffs,
light crossbows')
INSERT [dbo].[DnD5eClass] ([ClassID], [ClassName], [ClassDescription], [MulticlassReq], [HitDie], [SavingThrowProfs], [LightArmorProf], [MediumArmorProf], [HeavyArmorProf], [ShieldProf], [WeaponProfs]) VALUES (11, N'Warlock', N'A wielder of magic that is derived from
a bargain with an extraplanar entity', NULL, N'd8', N'Wisdom,Charisma', 1, 0, 0, 0, N'Simple Weapons')
INSERT [dbo].[DnD5eClass] ([ClassID], [ClassName], [ClassDescription], [MulticlassReq], [HitDie], [SavingThrowProfs], [LightArmorProf], [MediumArmorProf], [HeavyArmorProf], [ShieldProf], [WeaponProfs]) VALUES (12, N'Wizard', N'A scholarly magic-user capable of
manipulating the structures of reality', NULL, N'd6', N'Intelligence,Wisdom', 0, 0, 0, 0, N'Daggers, darts, slings, quarterstaffs,
light crossbows')
SET IDENTITY_INSERT [dbo].[DnD5eClass] OFF
SET IDENTITY_INSERT [dbo].[DnD5eClassFeatures] ON 

INSERT [dbo].[DnD5eClassFeatures] ([FeatureID], [ClassID], [SubClassID], [RequiredClassLevel], [FeatureName], [FeatureDescription]) VALUES (2, 1, NULL, 1, N'Unarmored Defense', N'W hile you are not wearing any armor, your Arm or Class
equals 10 + your Dexterity m odifier + your Constitution
modifier. You can use a shield and still gain this benefit.')
INSERT [dbo].[DnD5eClassFeatures] ([FeatureID], [ClassID], [SubClassID], [RequiredClassLevel], [FeatureName], [FeatureDescription]) VALUES (3, 1, NULL, 2, N'Reckless Attack', N'Starting at 2nd level, you can throw aside all concern
for defense to attack with fierce desperation. W hen
you make your first attack on your turn, you can decide
to attack recklessly. D oing so gives you advantage on
m elee weapon attack rolls using Strength during this
turn, but attack rolls against you have advantage until
your next turn.')
INSERT [dbo].[DnD5eClassFeatures] ([FeatureID], [ClassID], [SubClassID], [RequiredClassLevel], [FeatureName], [FeatureDescription]) VALUES (4, 1, NULL, 2, N'Danger Sense', N'At 2nd level, you gain an uncanny sense of when things
nearby aren’t as they should be, giving you an edge
when you dodge away from danger.
You have advantage on Dexterity saving throws
against effects that you can see, such as traps and spells.
To gain this benefit, you can’t be blinded, deafened, or
incapacitated.')
INSERT [dbo].[DnD5eClassFeatures] ([FeatureID], [ClassID], [SubClassID], [RequiredClassLevel], [FeatureName], [FeatureDescription]) VALUES (5, 1, NULL, 5, N'Extra Attack', N'Beginning at 5th level, you can attack twice, instead of
once, whenever you take the Attack action on your turn.')
INSERT [dbo].[DnD5eClassFeatures] ([FeatureID], [ClassID], [SubClassID], [RequiredClassLevel], [FeatureName], [FeatureDescription]) VALUES (6, 1, NULL, 5, N'Fast Movement', N'Starting at 5th level, your speed increases by 10 feet
while you aren’t w earing heavy armor.')
INSERT [dbo].[DnD5eClassFeatures] ([FeatureID], [ClassID], [SubClassID], [RequiredClassLevel], [FeatureName], [FeatureDescription]) VALUES (8, 1, NULL, 7, N'Feral Instinct', N'By 7th level, your instincts are so honed that you have
advantage on initiative rolls.
Additionally, if you are surprised at the beginning of
com bat and aren’t incapacitated, you can act normally
on your first turn, but only if you enter your rage before
doing anything else on that turn.')
INSERT [dbo].[DnD5eClassFeatures] ([FeatureID], [ClassID], [SubClassID], [RequiredClassLevel], [FeatureName], [FeatureDescription]) VALUES (9, 1, NULL, 9, N'Brutal Critical', N'Beginning at 9th level, you can roll one additional
weapon damage die when determining the extra
damage for a critical hit with a melee attack.
This increases to two additional dice at 13th level
and three additional dice at 17th level.')
INSERT [dbo].[DnD5eClassFeatures] ([FeatureID], [ClassID], [SubClassID], [RequiredClassLevel], [FeatureName], [FeatureDescription]) VALUES (10, 1, NULL, 11, N'Relentless Rage', N'Starting at 11th level, your rage can keep you fighting
despite grievous w ounds. If you drop to 0 hit points
while you’re raging and don’t die outright, you can make
a DC 10 Constitution saving throw. If you succeed, you
drop to 1 hit point instead.
Each time you use this feature after the first, the DC
increases by 5. W hen you finish a short or long rest, the
DC resets to 10.')
INSERT [dbo].[DnD5eClassFeatures] ([FeatureID], [ClassID], [SubClassID], [RequiredClassLevel], [FeatureName], [FeatureDescription]) VALUES (11, 1, NULL, 15, N'Persistent Rage', N'Beginning at 15th level, your rage is so fierce that
it ends early only if you fall unconscious or if you
choose to end it.')
INSERT [dbo].[DnD5eClassFeatures] ([FeatureID], [ClassID], [SubClassID], [RequiredClassLevel], [FeatureName], [FeatureDescription]) VALUES (12, 1, NULL, 18, N'Indomitable Might', N'Beginning at 18th level, if your total for a Strength
check is less than your Strength score, you can use that
score in place of the total.')
INSERT [dbo].[DnD5eClassFeatures] ([FeatureID], [ClassID], [SubClassID], [RequiredClassLevel], [FeatureName], [FeatureDescription]) VALUES (13, 1, NULL, 20, N'Primal Champion', N'At 20th level, you em body the pow er of the wilds. Your
Strength and Constitution scores increase by 4. Your
m axim um for those scores is now 24.')
INSERT [dbo].[DnD5eClassFeatures] ([FeatureID], [ClassID], [SubClassID], [RequiredClassLevel], [FeatureName], [FeatureDescription]) VALUES (15, 1, 1, 3, N'Frenzy', N'Starting w hen you choose this path at 3rd level, you
can go into a frenzy when you rage. If you do so, for
the duration of your rage you can make a single melee
w eapon attack as a bonus action on each of your turns
after this one. W hen your rage ends, you suffer one level
o f exhaustion (as described in appendix A).')
INSERT [dbo].[DnD5eClassFeatures] ([FeatureID], [ClassID], [SubClassID], [RequiredClassLevel], [FeatureName], [FeatureDescription]) VALUES (16, 1, 1, 6, N'Mindless Rage', N'Beginning at 6th level, you can’t be charm ed or
frightened while raging. If you are charm ed or
frightened when you enter your rage, the effect is
suspended for the duration of the rage.')
INSERT [dbo].[DnD5eClassFeatures] ([FeatureID], [ClassID], [SubClassID], [RequiredClassLevel], [FeatureName], [FeatureDescription]) VALUES (17, 1, 1, 10, N'Intimidating Presence', N'Beginning at 10th level, you can use your action to
frighten som eone with your menacing presence.
W hen you do so, choose one creature that you can see
within 30 feet of you. If the creature can see or hear
you, it must succeed on a W isdom saving throw (DC
equal to 8 + your proficiency bonus + your Charisma
modifier) or be frightened of you until the end of your
next turn. On subsequent turns, you can use your action
to extend the duration of this effect on the frightened creature until the end of your next turn. This effect ends
if the creature ends its turn out of line of sight or m ore
than 60 feet away from you.
If the creature succeeds on its saving throw, you can''t
use this feature on that creature again for 24 hours.')
INSERT [dbo].[DnD5eClassFeatures] ([FeatureID], [ClassID], [SubClassID], [RequiredClassLevel], [FeatureName], [FeatureDescription]) VALUES (18, 1, 1, 14, N'Retaliation', N'Starting at 14th level, when you take damage from
a creature that is within 5 feet of you. you can use
your reaction to make a melee weapon attack against
that creature')
INSERT [dbo].[DnD5eClassFeatures] ([FeatureID], [ClassID], [SubClassID], [RequiredClassLevel], [FeatureName], [FeatureDescription]) VALUES (19, 1, 2, 3, N'Spirit Seeker', N'Yours is a path that seeks attunement with the natural
world, giving you a kinship with beasts. At 3rd level when
you adopt this path, you gain the ability to cast the beast
sense and speak with animals spells, but only as rituals,
as described in chapter 10.')
INSERT [dbo].[DnD5eClassFeatures] ([FeatureID], [ClassID], [SubClassID], [RequiredClassLevel], [FeatureName], [FeatureDescription]) VALUES (20, 1, 4, 3, N'Spirit Seeker', N'Yours is a path that seeks attunement with the natural
world, giving you a kinship with beasts. At 3rd level when
you adopt this path, you gain the ability to cast the beast
sense and speak with animals spells, but only as rituals,
as described in chapter 10.')
INSERT [dbo].[DnD5eClassFeatures] ([FeatureID], [ClassID], [SubClassID], [RequiredClassLevel], [FeatureName], [FeatureDescription]) VALUES (21, 1, 5, 3, N'Spirit Seeker', N'Yours is a path that seeks attunement with the natural
world, giving you a kinship with beasts. At 3rd level when
you adopt this path, you gain the ability to cast the beast
sense and speak with animals spells, but only as rituals,
as described in chapter 10.')
INSERT [dbo].[DnD5eClassFeatures] ([FeatureID], [ClassID], [SubClassID], [RequiredClassLevel], [FeatureName], [FeatureDescription]) VALUES (22, 1, 2, 3, N'Totem Spirit', N'Bear. W hile raging, you have resistance to all damage
except psychic damage. The spirit of the bear m akes you
tough enough to stand up to any punishment.')
INSERT [dbo].[DnD5eClassFeatures] ([FeatureID], [ClassID], [SubClassID], [RequiredClassLevel], [FeatureName], [FeatureDescription]) VALUES (23, 1, 2, 6, N'Aspect of the Beast', N'Bear. You gain the might of a bear. Your carrying
capacity (including maximum load and maximum lift)
is doubled, and you have advantage on Strength checks
made to push, pull, lift, or break objects.')
INSERT [dbo].[DnD5eClassFeatures] ([FeatureID], [ClassID], [SubClassID], [RequiredClassLevel], [FeatureName], [FeatureDescription]) VALUES (24, 1, 2, 10, N'Spirit Walker', N'At 10th level, you can cast the commune with nature
spell, but only as a ritual. W hen you do so, a spiritual
version of one of the animals you chose for Totem Spirit
or Aspect of the Beast appears to you to convey the
information you seek.')
INSERT [dbo].[DnD5eClassFeatures] ([FeatureID], [ClassID], [SubClassID], [RequiredClassLevel], [FeatureName], [FeatureDescription]) VALUES (28, 1, 4, 10, N'Spirit Walker', N'At 10th level, you can cast the commune with nature
spell, but only as a ritual. W hen you do so, a spiritual
version of one of the animals you chose for Totem Spirit
or Aspect of the Beast appears to you to convey the
information you seek.')
INSERT [dbo].[DnD5eClassFeatures] ([FeatureID], [ClassID], [SubClassID], [RequiredClassLevel], [FeatureName], [FeatureDescription]) VALUES (29, 1, 5, 10, N'Spirit Walker', N'At 10th level, you can cast the commune with nature
spell, but only as a ritual. W hen you do so, a spiritual
version of one of the animals you chose for Totem Spirit
or Aspect of the Beast appears to you to convey the
information you seek.')
INSERT [dbo].[DnD5eClassFeatures] ([FeatureID], [ClassID], [SubClassID], [RequiredClassLevel], [FeatureName], [FeatureDescription]) VALUES (30, 1, 2, 14, N'Totemic Attunement', N'Bear, W hile you’re raging, any creature within 5 feet
o f you that’s hostile to you has disadvantage on attack
rolls against targets other than you or another character
with this feature. An enemy is im mune to this effect if it
can’t see or hear you or if it can’t be frightened.')
INSERT [dbo].[DnD5eClassFeatures] ([FeatureID], [ClassID], [SubClassID], [RequiredClassLevel], [FeatureName], [FeatureDescription]) VALUES (31, 1, 4, 6, N'Aspect of the Beast', N'Eagle. You gain the eyesight of an eagle. You can
see up to 1 mile away with no difficulty, able to discern
even fine details as though looking at som ething no
m ore than 100 feet away from you. Additionally, dim
light doesn''t im pose disadvantage on your W isdom
(Perception) checks')
INSERT [dbo].[DnD5eClassFeatures] ([FeatureID], [ClassID], [SubClassID], [RequiredClassLevel], [FeatureName], [FeatureDescription]) VALUES (32, 1, 5, 6, N'Aspect of the Beast', N'Wolf, You gain the hunting sensibilities of a wolf. You
can track other creatures while traveling at a fast pace,
and you can move stealthily while traveling at a normal
pace (see chapter 8 for rules on travel pace).')
INSERT [dbo].[DnD5eClassFeatures] ([FeatureID], [ClassID], [SubClassID], [RequiredClassLevel], [FeatureName], [FeatureDescription]) VALUES (33, 1, 4, 14, N'Totemic Attunement', N'Eagle. W hile raging, you have a flying speed equal to
your current walking speed. This benefit works only in
short bursts; you fall if you end your turn in the air and
nothing else is holding you aloft.')
INSERT [dbo].[DnD5eClassFeatures] ([FeatureID], [ClassID], [SubClassID], [RequiredClassLevel], [FeatureName], [FeatureDescription]) VALUES (34, 1, 5, 14, N'Totemic Attunement', N'Wolf. W hile you’re raging, you can use a bonus action
on your turn to knock a Large or sm aller creature prone
w hen you hit it with m elee weapon attack.')
INSERT [dbo].[DnD5eClassFeatures] ([FeatureID], [ClassID], [SubClassID], [RequiredClassLevel], [FeatureName], [FeatureDescription]) VALUES (35, 2, NULL, 1, N'Bardic Inspiration', N'You can inspire others through stirring w ords or music.
To do so, you use a bonus action on your turn to choose
one creature other than yourself within 60 feet of you
w ho can hear you. That creature gains one Bardic
Inspiration die, a d6.
Once within the next 10 minutes, the creature can roll
the die and add the number rolled to one ability check,
attack roll, or saving throw it makes. The creature can
wait until after it rolls the d20 before deciding to use the
Bardic Inspiration die, but must decide before the DM
says whether the roll succeeds or fails. Once the Bardic
Inspiration die is rolled, it is lost. A creature can have
only one Bardic Inspiration die at a time.
T h e B a r d
Level
Proficiency
Bonus Features
Cantrips
Known
Spells
Known
— Spell Slots per Spell Level—
1st 2nd 3rd 4th 5th 6th 7th 8th 9th
1st +2 Spellcasting, Bardic Inspiration (d6) 2 4 2 — — — — — — — —
2nd +2 jack of All Trades, Song of Rest (d 6) 2 5 3 — — — — — — — —
3rd +2 Bard College, Expertise 2 6 4 2 — — — — — — —
4th +2 Ability Score Improvement 3 7 4 3 — — — — — — —
5th +3 Bardic Inspiration (d8),
Font of Inspiration
3 8 4 3 2 — — — — — —
6th +3 Countercharm, Bard College feature 3 9 4 3 3 — — — — — —
7th +3 — 3 10 4 3 3 1 — — — — —
8th +3 Ability Score Improvement 3 11 4 3 3 2 — — — — —
9th +4 Song of Rest (d8) 3 12 4 3 3 3 1 — — — —
10th +4 Bardic Inspiration (d10), Expertise,
Magical Secrets
4 14 4 3 3 3 2 — — — —
11th +4 — 4 15 4 3 3 3 2 1 — — —
12th +4 Ability Score Improvement 4 15 4 3 3 3 2 1 — — —
13th +5 Song of Rest (d10) 4 16 4 3 3 3 2 1 1 — —
14th +5 Magical Secrets,
Bard College feature
4 18 4 3 3 3 2 1 1 — —
15th +5 Bardic Inspiration (d12) 4 19 4 3 3 3 2 1 1 1 —
16th +5 Ability Score Improvement 4 19 4 3 3 3 2 1 1 1 —
17th +6 Song of Rest (d12) 4 20 4 3 3 3 2 1 1 1 1
18th +6 Magical Secrets 4 22 4 3 3 3 3 1 1 1 1
19th +6 Ability Score Improvement 4 22 4 3 3 3 3 2 1 1 1
20th +6 Superior Inspiration 4 22 4 3 3 3 3 2 2 1 1
You can use this feature a number of tim es equal
to your Charisma modifier (a minim um of once). You
regain any expended uses w hen you finish a long rest.
Your Bardic Inspiration die changes when you reach
certain levels in this class. The die becom es a d8 at 5th
level, a d 10 at 10th level, and a d l2 at 15th level.')
INSERT [dbo].[DnD5eClassFeatures] ([FeatureID], [ClassID], [SubClassID], [RequiredClassLevel], [FeatureName], [FeatureDescription]) VALUES (36, 2, NULL, 2, N'Jack of All Trades', N'Starting at 2nd level, you can add half your proficiency
bonus, rounded down, to any ability check you make that
doesn’t already include your proficiency bonus.')
INSERT [dbo].[DnD5eClassFeatures] ([FeatureID], [ClassID], [SubClassID], [RequiredClassLevel], [FeatureName], [FeatureDescription]) VALUES (37, 2, NULL, 2, N'Song of Rest', N'Beginning at 2nd level, you can use soothing music or
oration to help revitalize your wounded allies during
a short rest. If you or any friendly creatures w ho can
hear your perform ance regain hit points at the end of
the short rest, each of those creatures regains an extra
1d6 hit points.
The extra hit points increase when you reach certain
levels in this class: to 1d8 at 9th level, to 1d 10 at 13th
level, and to 1d 12 at 17th level.')
INSERT [dbo].[DnD5eClassFeatures] ([FeatureID], [ClassID], [SubClassID], [RequiredClassLevel], [FeatureName], [FeatureDescription]) VALUES (38, 2, NULL, 3, N'Expertise', N'At 3rd level, choose two of your skill proficiencies. Your
proficiency bonus is doubled for any ability check you
make that uses either of the chosen proficiencies.
At 10th level, you can choose another two skill
proficiencies to gain this benefit.')
INSERT [dbo].[DnD5eClassFeatures] ([FeatureID], [ClassID], [SubClassID], [RequiredClassLevel], [FeatureName], [FeatureDescription]) VALUES (39, 2, NULL, 5, N'Font of Inspiration', N'Beginning when you reach 5th level, you regain all of
your expended uses of Bardic Inspiration when you
finish a short or long rest.')
INSERT [dbo].[DnD5eClassFeatures] ([FeatureID], [ClassID], [SubClassID], [RequiredClassLevel], [FeatureName], [FeatureDescription]) VALUES (41, 2, NULL, 6, N'Countercharm', N'At 6th level, you gain the ability to use musical notes or
w ords of pow er to disrupt mind-influencing effects. As
an action, you can start a perform ance that lasts until
the end of your next turn. During that time, you and any
friendly creatures within 30 feet of you have advantage
on saving throws against being frightened or charmed.
A creature must be able to hear you to gain this benefit.
The perform ance ends early if you are incapacitated or
silenced or if you voluntarily end it (no action required).')
INSERT [dbo].[DnD5eClassFeatures] ([FeatureID], [ClassID], [SubClassID], [RequiredClassLevel], [FeatureName], [FeatureDescription]) VALUES (42, 2, NULL, 10, N'Magical Secrets', N'By 10th level, you have plundered magical knowledge
from a w ide spectrum of disciplines. C hoose two spells
from any class, including this one. A spell you choose
must be of a level you can cast, as shown on the Bard
table, or a cantrip.
The chosen spells count as bard spells for you and are
included in the number in the Spells K now n colum n of
the Bard table.
You learn two additional spells from any class at 14th
level and again at 18th level.')
INSERT [dbo].[DnD5eClassFeatures] ([FeatureID], [ClassID], [SubClassID], [RequiredClassLevel], [FeatureName], [FeatureDescription]) VALUES (43, 2, NULL, 20, N'Superior Inspiration', N'At 20th level, when you roll initiative and have no uses
of Bardic Inspiration left, you regain one use.')
INSERT [dbo].[DnD5eClassFeatures] ([FeatureID], [ClassID], [SubClassID], [RequiredClassLevel], [FeatureName], [FeatureDescription]) VALUES (44, 2, 6, 3, N'Bonus Proficiencies', N'W hen you join the College of Lore at 3rd level, you gain
proficiency with three skills o f your choice.')
INSERT [dbo].[DnD5eClassFeatures] ([FeatureID], [ClassID], [SubClassID], [RequiredClassLevel], [FeatureName], [FeatureDescription]) VALUES (45, 2, 6, 3, N'Cutting Words', N'A lso at 3rd level, you learn how to use your wit to
distract, confuse, and otherwise sap the confidence and
com petence of others. W hen a creature that you can
see within 60 feet of you makes an attack roll, an ability
check, or a damage roll, you can use your reaction to
expend one of your uses of Bardic Inspiration, rolling
a Bardic Inspiration die and subtracting the number
rolled from the creature’s roll. You can choose to use
this feature after the creature makes its roll, but before
the DM determines whether the attack roll or ability
check succeeds or fails, or before the creature deals its
damage. The creature is immune if it can’t hear you or if
it’s immune to being charmed.')
INSERT [dbo].[DnD5eClassFeatures] ([FeatureID], [ClassID], [SubClassID], [RequiredClassLevel], [FeatureName], [FeatureDescription]) VALUES (46, 2, 6, 6, N'Additional Magical Secrets', N'At 6th level, you learn two spells of your choice from any
class. A spell you choose must be of a level you can cast,
as shown on the Bard table, or a cantrip. The chosen
spells count as bard spells for you but don’t count
against the number of bard spells you know.')
INSERT [dbo].[DnD5eClassFeatures] ([FeatureID], [ClassID], [SubClassID], [RequiredClassLevel], [FeatureName], [FeatureDescription]) VALUES (47, 2, 6, 14, N'Peerless Skill', N'Starting at 14th level, when you make an ability check,
you can expend one use of Bardic Inspiration. Roll a
Bardic Inspiration die and add the number rolled to
your ability check. You can choose to do so after you roil
the die for the ability check, but before the DM tells you
whether you succeed or fail.')
INSERT [dbo].[DnD5eClassFeatures] ([FeatureID], [ClassID], [SubClassID], [RequiredClassLevel], [FeatureName], [FeatureDescription]) VALUES (48, 2, 7, 3, N'Bonus Proficiencies', N'W hen you join the College of Valor at 3rd level, you
gain proficiency with medium armor, shields, and
martial weapons.')
INSERT [dbo].[DnD5eClassFeatures] ([FeatureID], [ClassID], [SubClassID], [RequiredClassLevel], [FeatureName], [FeatureDescription]) VALUES (49, 2, 7, 3, N'Combat Inspiration', N'Also at 3rd level, you learn to inspire others in battle.
A creature that has a Bardic Inspiration die from you
can roll that die and add the number rolled to a weapon
damage roll it just made. Alternatively, when an attack
roll is made against the creature, it can use its reaction
to roll the Bardic Inspiration die and add the number
rolled to its AC against that attack, after seeing the roll
but before knowing whether it hits or m isses.')
INSERT [dbo].[DnD5eClassFeatures] ([FeatureID], [ClassID], [SubClassID], [RequiredClassLevel], [FeatureName], [FeatureDescription]) VALUES (50, 2, 7, 6, N'Extra Attack', N'Starting at 6th level, you can attack twice, instead of
once, whenever you take the Attack action on your turn.')
INSERT [dbo].[DnD5eClassFeatures] ([FeatureID], [ClassID], [SubClassID], [RequiredClassLevel], [FeatureName], [FeatureDescription]) VALUES (51, 2, 7, 14, N'Battle Magic', N'At 14th level, you have mastered the art of weaving
spellcasting and weapon use into a single harm onious
act. W hen you use your action to cast a bard spell, you
can make one weapon attack as a bonus action.')
INSERT [dbo].[DnD5eClassFeatures] ([FeatureID], [ClassID], [SubClassID], [RequiredClassLevel], [FeatureName], [FeatureDescription]) VALUES (52, 3, NULL, 2, N'Channel Divinity: Turn Undead', N'As an action, you present your holy sym bol and speak a
prayer censuring the undead. Each undead that can see
or hear you within 30 feet of you must make a W isdom
saving throw. If the creature fails its saving throw, it is
turned for 1 minute or until it takes any damage.
A turned creature must spend its turns trying to move
as far away from you as it can, and it can’t willingly
move to a space within 30 feet of you. It also can’t take
reactions. For its action, it can use only the Dash action
or try to escape from an effect that prevents it from
moving. If there’s nowhere to move, the creature can use
the D odge action.')
INSERT [dbo].[DnD5eClassFeatures] ([FeatureID], [ClassID], [SubClassID], [RequiredClassLevel], [FeatureName], [FeatureDescription]) VALUES (53, 3, NULL, 5, N'Destroy Undead', N'Starting at 5th level, when an undead fails its saving
throw against your Turn Undead feature, the creature is
instantly destroyed if its challenge rating is at or below a
certain threshold, as shown in the Destroy Undead table.')
INSERT [dbo].[DnD5eClassFeatures] ([FeatureID], [ClassID], [SubClassID], [RequiredClassLevel], [FeatureName], [FeatureDescription]) VALUES (54, 3, NULL, 10, N'Divine Intervention', N'Beginning at 10th level, you can call on your deity to
intervene on your behalf when your need is great.
Imploring your deity’s aid requires you to use your
action. D escribe the assistance you seek, and roll
percentile dice. If you roll a number equal to or lower
than your cleric level, your deity intervenes. The DM
chooses the nature of the intervention; the effect of any
cleric spell or cleric dom ain spell w ould be appropriate.
If your deity intervenes, you can’t use this feature
again for 7 days. Otherwise, you can use it again after
you finish a long rest.
At 20th level, your call for intervention succeeds
automatically, no roll required.')
INSERT [dbo].[DnD5eClassFeatures] ([FeatureID], [ClassID], [SubClassID], [RequiredClassLevel], [FeatureName], [FeatureDescription]) VALUES (55, 3, 8, 3, N'Blessings of Knowledge', N'At 1st level, you learn two languages of your choice.
You also becom e proficient in your choice o f two of the
following skills: Arcana, History, Nature, or Religion.
Your proficiency bonus is doubled for any ability check
you make that uses either of those skills')
INSERT [dbo].[DnD5eClassFeatures] ([FeatureID], [ClassID], [SubClassID], [RequiredClassLevel], [FeatureName], [FeatureDescription]) VALUES (56, 3, 8, 2, N'Channel Divinity: Knowledge of the Ages', N'Starting at 2nd level, you can use your Channel Divinity
to tap into a divine w ell o f knowledge. As an action,
you choose one skill or tool. For 10 minutes, you have
proficiency with the chosen skill or tool.')
INSERT [dbo].[DnD5eClassFeatures] ([FeatureID], [ClassID], [SubClassID], [RequiredClassLevel], [FeatureName], [FeatureDescription]) VALUES (57, 3, 8, 2, N'Channel Divinity: Read Thoughts', N'At 6th level, you can use your Channel Divinity to read a
creature’s thoughts. You can then use your access to the
creature’s mind to com m and it.
A s an action, choose one creature that you can see
within 60 feet of you. That creature must make a
W isdom saving throw. If the creature succeeds on the
saving throw, you can’t use this feature on it again until
you finish a long rest.
If the creature fails its save, you can read its surface
thoughts (those forem ost in its mind, reflecting its
current em otions and what it is actively thinking
about) w hen it is within 60 feet of you. This effect lasts
for 1 minute.
During that time, you can use your action to end this
effect and cast the suggestion spell on the creature
without expending a spell slot. The target automatically
fails its saving throw against the spell.')
INSERT [dbo].[DnD5eClassFeatures] ([FeatureID], [ClassID], [SubClassID], [RequiredClassLevel], [FeatureName], [FeatureDescription]) VALUES (58, 3, 8, 8, N'Potent Spellcasting', N'Starting at 8th level, you add your W isdom modifier to
the damage you deal with any cleric cantrip.')
INSERT [dbo].[DnD5eClassFeatures] ([FeatureID], [ClassID], [SubClassID], [RequiredClassLevel], [FeatureName], [FeatureDescription]) VALUES (59, 3, 8, 17, N'Visions of the Past', N'Starting at 17th level, you can call up visions of the
past that relate to an object you hold or your immediate
surroundings. You spend at least 1 minute in meditation
and prayer, then receive dreamlike, shadowy glim pses
of recent events. You can meditate in this way for a
number of minutes equal to your W isdom score and
must maintain concentration during that time, as if you
were casting a spell.
Once you use this feature, you can’t use it again until
you finish a short or long rest.
Object Reading. Holding an object as you meditate,
you can see visions of the object’s previous owner.
After meditating for 1 minute, you learn how the owner
acquired and lost the object, as well as the m ost recent
significant event involving the object and that owner.
If the object w as ow ned by another creature in the
recent past (within a number of days equal to your
W isdom score), you can spend 1 additional minute
for each owner to learn the sam e information about
that creature.
Area Reading. As you meditate, you see visions
of recent events in your immediate vicinity (a room,
street, tunnel, clearing, or the like, up to a 50-foot cube),
going back a number of days equal to your W isdom
score. For each minute you meditate, you learn about
one significant event, beginning with the m ost recent.
Significant events typically involve powerful emotions,
such as battles and betrayals, marriages and murders,
births and funerals. However, they might also include
m ore mundane events that are nevertheless important
in your current situation.')
SET IDENTITY_INSERT [dbo].[DnD5eClassFeatures] OFF
INSERT [dbo].[DnD5eClassSkillProf] ([ClassID], [SkillID], [HasProficiency]) VALUES (1, 10, 1)
INSERT [dbo].[DnD5eClassSkillProf] ([ClassID], [SkillID], [HasProficiency]) VALUES (1, 1, 1)
INSERT [dbo].[DnD5eClassSkillProf] ([ClassID], [SkillID], [HasProficiency]) VALUES (1, 16, 1)
INSERT [dbo].[DnD5eClassSkillProf] ([ClassID], [SkillID], [HasProficiency]) VALUES (1, 8, 1)
INSERT [dbo].[DnD5eClassSkillProf] ([ClassID], [SkillID], [HasProficiency]) VALUES (1, 13, 1)
INSERT [dbo].[DnD5eClassSkillProf] ([ClassID], [SkillID], [HasProficiency]) VALUES (1, 14, 1)
INSERT [dbo].[DnD5eClassSkillProf] ([ClassID], [SkillID], [HasProficiency]) VALUES (3, 6, 1)
INSERT [dbo].[DnD5eClassSkillProf] ([ClassID], [SkillID], [HasProficiency]) VALUES (3, 11, 1)
INSERT [dbo].[DnD5eClassSkillProf] ([ClassID], [SkillID], [HasProficiency]) VALUES (3, 12, 1)
INSERT [dbo].[DnD5eClassSkillProf] ([ClassID], [SkillID], [HasProficiency]) VALUES (3, 18, 1)
INSERT [dbo].[DnD5eClassSkillProf] ([ClassID], [SkillID], [HasProficiency]) VALUES (3, 9, 1)
INSERT [dbo].[DnD5eClassSkillProf] ([ClassID], [SkillID], [HasProficiency]) VALUES (4, 5, 1)
INSERT [dbo].[DnD5eClassSkillProf] ([ClassID], [SkillID], [HasProficiency]) VALUES (4, 10, 1)
INSERT [dbo].[DnD5eClassSkillProf] ([ClassID], [SkillID], [HasProficiency]) VALUES (4, 11, 1)
INSERT [dbo].[DnD5eClassSkillProf] ([ClassID], [SkillID], [HasProficiency]) VALUES (4, 12, 1)
INSERT [dbo].[DnD5eClassSkillProf] ([ClassID], [SkillID], [HasProficiency]) VALUES (4, 8, 1)
INSERT [dbo].[DnD5eClassSkillProf] ([ClassID], [SkillID], [HasProficiency]) VALUES (4, 13, 1)
INSERT [dbo].[DnD5eClassSkillProf] ([ClassID], [SkillID], [HasProficiency]) VALUES (4, 14, 1)
INSERT [dbo].[DnD5eClassSkillProf] ([ClassID], [SkillID], [HasProficiency]) VALUES (4, 9, 1)
INSERT [dbo].[DnD5eClassSkillProf] ([ClassID], [SkillID], [HasProficiency]) VALUES (5, 2, 1)
INSERT [dbo].[DnD5eClassSkillProf] ([ClassID], [SkillID], [HasProficiency]) VALUES (5, 10, 1)
INSERT [dbo].[DnD5eClassSkillProf] ([ClassID], [SkillID], [HasProficiency]) VALUES (5, 1, 1)
INSERT [dbo].[DnD5eClassSkillProf] ([ClassID], [SkillID], [HasProficiency]) VALUES (5, 6, 1)
INSERT [dbo].[DnD5eClassSkillProf] ([ClassID], [SkillID], [HasProficiency]) VALUES (5, 11, 1)
INSERT [dbo].[DnD5eClassSkillProf] ([ClassID], [SkillID], [HasProficiency]) VALUES (5, 16, 1)
INSERT [dbo].[DnD5eClassSkillProf] ([ClassID], [SkillID], [HasProficiency]) VALUES (5, 13, 1)
INSERT [dbo].[DnD5eClassSkillProf] ([ClassID], [SkillID], [HasProficiency]) VALUES (5, 14, 1)
INSERT [dbo].[DnD5eClassSkillProf] ([ClassID], [SkillID], [HasProficiency]) VALUES (6, 2, 1)
INSERT [dbo].[DnD5eClassSkillProf] ([ClassID], [SkillID], [HasProficiency]) VALUES (6, 1, 1)
INSERT [dbo].[DnD5eClassSkillProf] ([ClassID], [SkillID], [HasProficiency]) VALUES (6, 6, 1)
INSERT [dbo].[DnD5eClassSkillProf] ([ClassID], [SkillID], [HasProficiency]) VALUES (6, 11, 1)
INSERT [dbo].[DnD5eClassSkillProf] ([ClassID], [SkillID], [HasProficiency]) VALUES (6, 9, 1)
INSERT [dbo].[DnD5eClassSkillProf] ([ClassID], [SkillID], [HasProficiency]) VALUES (6, 4, 1)
INSERT [dbo].[DnD5eClassSkillProf] ([ClassID], [SkillID], [HasProficiency]) VALUES (7, 1, 1)
INSERT [dbo].[DnD5eClassSkillProf] ([ClassID], [SkillID], [HasProficiency]) VALUES (7, 11, 1)
INSERT [dbo].[DnD5eClassSkillProf] ([ClassID], [SkillID], [HasProficiency]) VALUES (7, 16, 1)
INSERT [dbo].[DnD5eClassSkillProf] ([ClassID], [SkillID], [HasProficiency]) VALUES (7, 12, 1)
INSERT [dbo].[DnD5eClassSkillProf] ([ClassID], [SkillID], [HasProficiency]) VALUES (7, 18, 1)
INSERT [dbo].[DnD5eClassSkillProf] ([ClassID], [SkillID], [HasProficiency]) VALUES (7, 9, 1)
INSERT [dbo].[DnD5eClassSkillProf] ([ClassID], [SkillID], [HasProficiency]) VALUES (8, 10, 1)
INSERT [dbo].[DnD5eClassSkillProf] ([ClassID], [SkillID], [HasProficiency]) VALUES (8, 1, 1)
INSERT [dbo].[DnD5eClassSkillProf] ([ClassID], [SkillID], [HasProficiency]) VALUES (8, 11, 1)
INSERT [dbo].[DnD5eClassSkillProf] ([ClassID], [SkillID], [HasProficiency]) VALUES (8, 7, 1)
INSERT [dbo].[DnD5eClassSkillProf] ([ClassID], [SkillID], [HasProficiency]) VALUES (8, 8, 1)
INSERT [dbo].[DnD5eClassSkillProf] ([ClassID], [SkillID], [HasProficiency]) VALUES (8, 13, 1)
INSERT [dbo].[DnD5eClassSkillProf] ([ClassID], [SkillID], [HasProficiency]) VALUES (8, 4, 1)
INSERT [dbo].[DnD5eClassSkillProf] ([ClassID], [SkillID], [HasProficiency]) VALUES (8, 14, 1)
INSERT [dbo].[DnD5eClassSkillProf] ([ClassID], [SkillID], [HasProficiency]) VALUES (9, 1, 1)
INSERT [dbo].[DnD5eClassSkillProf] ([ClassID], [SkillID], [HasProficiency]) VALUES (9, 2, 1)
INSERT [dbo].[DnD5eClassSkillProf] ([ClassID], [SkillID], [HasProficiency]) VALUES (9, 3, 1)
INSERT [dbo].[DnD5eClassSkillProf] ([ClassID], [SkillID], [HasProficiency]) VALUES (9, 15, 1)
INSERT [dbo].[DnD5eClassSkillProf] ([ClassID], [SkillID], [HasProficiency]) VALUES (9, 11, 1)
INSERT [dbo].[DnD5eClassSkillProf] ([ClassID], [SkillID], [HasProficiency]) VALUES (9, 16, 1)
INSERT [dbo].[DnD5eClassSkillProf] ([ClassID], [SkillID], [HasProficiency]) VALUES (9, 7, 1)
INSERT [dbo].[DnD5eClassSkillProf] ([ClassID], [SkillID], [HasProficiency]) VALUES (9, 13, 1)
INSERT [dbo].[DnD5eClassSkillProf] ([ClassID], [SkillID], [HasProficiency]) VALUES (9, 17, 1)
INSERT [dbo].[DnD5eClassSkillProf] ([ClassID], [SkillID], [HasProficiency]) VALUES (9, 18, 1)
INSERT [dbo].[DnD5eClassSkillProf] ([ClassID], [SkillID], [HasProficiency]) VALUES (9, 4, 1)
INSERT [dbo].[DnD5eClassSkillProf] ([ClassID], [SkillID], [HasProficiency]) VALUES (10, 5, 1)
INSERT [dbo].[DnD5eClassSkillProf] ([ClassID], [SkillID], [HasProficiency]) VALUES (10, 15, 1)
INSERT [dbo].[DnD5eClassSkillProf] ([ClassID], [SkillID], [HasProficiency]) VALUES (10, 11, 1)
INSERT [dbo].[DnD5eClassSkillProf] ([ClassID], [SkillID], [HasProficiency]) VALUES (10, 16, 1)
INSERT [dbo].[DnD5eClassSkillProf] ([ClassID], [SkillID], [HasProficiency]) VALUES (10, 18, 1)
INSERT [dbo].[DnD5eClassSkillProf] ([ClassID], [SkillID], [HasProficiency]) VALUES (10, 9, 1)
INSERT [dbo].[DnD5eClassSkillProf] ([ClassID], [SkillID], [HasProficiency]) VALUES (11, 5, 1)
INSERT [dbo].[DnD5eClassSkillProf] ([ClassID], [SkillID], [HasProficiency]) VALUES (11, 15, 1)
INSERT [dbo].[DnD5eClassSkillProf] ([ClassID], [SkillID], [HasProficiency]) VALUES (11, 6, 1)
INSERT [dbo].[DnD5eClassSkillProf] ([ClassID], [SkillID], [HasProficiency]) VALUES (11, 16, 1)
INSERT [dbo].[DnD5eClassSkillProf] ([ClassID], [SkillID], [HasProficiency]) VALUES (11, 7, 1)
INSERT [dbo].[DnD5eClassSkillProf] ([ClassID], [SkillID], [HasProficiency]) VALUES (11, 8, 1)
INSERT [dbo].[DnD5eClassSkillProf] ([ClassID], [SkillID], [HasProficiency]) VALUES (11, 9, 1)
INSERT [dbo].[DnD5eClassSkillProf] ([ClassID], [SkillID], [HasProficiency]) VALUES (12, 5, 1)
INSERT [dbo].[DnD5eClassSkillProf] ([ClassID], [SkillID], [HasProficiency]) VALUES (12, 6, 1)
INSERT [dbo].[DnD5eClassSkillProf] ([ClassID], [SkillID], [HasProficiency]) VALUES (12, 11, 1)
INSERT [dbo].[DnD5eClassSkillProf] ([ClassID], [SkillID], [HasProficiency]) VALUES (12, 7, 1)
INSERT [dbo].[DnD5eClassSkillProf] ([ClassID], [SkillID], [HasProficiency]) VALUES (12, 12, 1)
INSERT [dbo].[DnD5eClassSkillProf] ([ClassID], [SkillID], [HasProficiency]) VALUES (12, 9, 1)
SET IDENTITY_INSERT [dbo].[DnD5eFeats] ON 

INSERT [dbo].[DnD5eFeats] ([FeatID], [FeatName], [StatPrerequisite], [MagicPrerequisite], [ArmorProfPrerequisite], [FeatDescription]) VALUES (8000, N'Alert', NULL, NULL, NULL, N'Always on the lookout for danger, you gain the following benefits:
• You gain a +5 bonus to initiative. • You can’t be surprised while you are conscious. • Other creatures don’t gain advantage on attack rolls against you as a result of being hidden from you.')
INSERT [dbo].[DnD5eFeats] ([FeatID], [FeatName], [StatPrerequisite], [MagicPrerequisite], [ArmorProfPrerequisite], [FeatDescription]) VALUES (8002, N'Athlete', NULL, NULL, NULL, N'You have undergone extensive physical training to gain the following benefits:
• Increase your Strength or Dexterity score by 1, to a maximum of 20. • When you are prone, standing up uses only 5 feet of your movement.
 • Climbing doesn’t halve your speed. • You can make a running long jump or a running high jump after moving only 5 feet on foot, rather than 10 feet.')
INSERT [dbo].[DnD5eFeats] ([FeatID], [FeatName], [StatPrerequisite], [MagicPrerequisite], [ArmorProfPrerequisite], [FeatDescription]) VALUES (8003, N'Actor', NULL, NULL, NULL, N'Skilled at mimicry and dramatics, you gain the following benefits:
• Increase your Charisma score by 1, to a maximum of 20. • You have advantage on Charisma (Deception) and Charisma (Performance) checks when trying to pass yourself off as a different person. • You can mimic the speech of another person or the sounds made by other creatures. You must have heard the person speaking, or heard the creature make the sound, for at least 1 minute. A successful Wisdom (Insight) check contested by your Charisma (Deception) check allows a listener to determine that the effect is faked.')
INSERT [dbo].[DnD5eFeats] ([FeatID], [FeatName], [StatPrerequisite], [MagicPrerequisite], [ArmorProfPrerequisite], [FeatDescription]) VALUES (8004, N'Charger', NULL, NULL, NULL, N'When you use your action to Dash, you can use a bonus action to make one melee weapon attack or to shove a creature. If you move at least 10 feet in a straight line immediately before taking this bonus action, you either gain a +5 bonus to the attack’s damage roll (if you chose to make a melee attack and hit) or push the target up to 10 feet away from you (if you chose to shove and you succeed).')
INSERT [dbo].[DnD5eFeats] ([FeatID], [FeatName], [StatPrerequisite], [MagicPrerequisite], [ArmorProfPrerequisite], [FeatDescription]) VALUES (8005, N'Crossbow Expert', NULL, NULL, NULL, N'Thanks to extensive practice with the crossbow, you gain the following benefits:
• You ignore the loading quality of crossbows with which you are proficient. • Being within 5 feet of a hostile creature doesn’t impose disadvantage on your ranged attack rolls. • When you use the Attack action and attack with a one- handed weapon, you can use a bonus action to attack with a loaded hand crossbow you are holding.')
INSERT [dbo].[DnD5eFeats] ([FeatID], [FeatName], [StatPrerequisite], [MagicPrerequisite], [ArmorProfPrerequisite], [FeatDescription]) VALUES (8006, N'Defensive Duelist', N'DEX,13', NULL, NULL, N'When you are wielding a finesse weapon with which you are proficient and another creature hits you with a melee attack, you can use your reaction to add your proficiency bonus to your AC for that attack, potentially causing the attack to miss you.')
INSERT [dbo].[DnD5eFeats] ([FeatID], [FeatName], [StatPrerequisite], [MagicPrerequisite], [ArmorProfPrerequisite], [FeatDescription]) VALUES (8007, N'Dual Wielder', NULL, NULL, NULL, N'You master fighting with two weapons, gaining the following benefits:
• You gain a +1 bonus to AC while you are wielding a separate melee weapon in each hand. • You can use two-weapon fighting even when the one- handed melee weapons you are wielding aren’t light. • You can draw or stow two one-handed weapons when you would normally be able to draw or stow only one.
')
INSERT [dbo].[DnD5eFeats] ([FeatID], [FeatName], [StatPrerequisite], [MagicPrerequisite], [ArmorProfPrerequisite], [FeatDescription]) VALUES (8008, N'Dungeon Delver', NULL, NULL, NULL, N'Alert to the hidden traps and secret doors found in many dungeons, you gain the following benefits:
• When you roll a Hit Die to regain hit points, the minimum number of hit points you regain from the roll equals twice your Constitution modifier (minimum of 2).
• You have advantage on W isdom (Perception) and Intelligence (Investigation) checks made to detect the presence of secret doors. • You have advantage on saving throws made to avoid or resist traps. • You have resistance to the damage dealt by traps. • You can search for traps while traveling at a normal pace, instead of only at a slow pace.')
INSERT [dbo].[DnD5eFeats] ([FeatID], [FeatName], [StatPrerequisite], [MagicPrerequisite], [ArmorProfPrerequisite], [FeatDescription]) VALUES (8009, N'Durable', NULL, NULL, NULL, N'Hardy and resilient, you gain the following benefits:
• Increase your Constitution score by 1, to a maximum of 20.
 • When you roll a Hit Die to regain hit points, the minimum number of hit points you regain from the roll equals twice your Constitution modifier (minimum of 2).')
INSERT [dbo].[DnD5eFeats] ([FeatID], [FeatName], [StatPrerequisite], [MagicPrerequisite], [ArmorProfPrerequisite], [FeatDescription]) VALUES (8011, N'Elemental Adept', NULL, N'1', NULL, N'Prerequisite: The ability to cast at least one spell
When you gain this feat, choose one of the following damage types: acid, cold, fire, lightning, or thunder. Spells you cast ignore resistance to damage of the chosen type. In addition, when you roll damage for a spell you cast that deals damage of that type, you can treat any 1 on a damage die as a 2. You can select this feat multiple times. Each time you do so, you must choose a different damage type.')
INSERT [dbo].[DnD5eFeats] ([FeatID], [FeatName], [StatPrerequisite], [MagicPrerequisite], [ArmorProfPrerequisite], [FeatDescription]) VALUES (8012, N'Grappler', N'STR,13', NULL, NULL, N'You’ve developed the skills necessary to hold your own in close-quarters grappling. You gain the following benefits: • You have advantage on attack rolls against a creature you are grappling. • You can use your action to try to pin a creature grap- pled by you. To do so, make another grapple check. If you succeed, you and the creature are both restrained until the grapple ends. • Creatures that are one size larger than you don’t auto- matically succeed on checks to escape your grapple.')
INSERT [dbo].[DnD5eFeats] ([FeatID], [FeatName], [StatPrerequisite], [MagicPrerequisite], [ArmorProfPrerequisite], [FeatDescription]) VALUES (8013, N'Great Weapon Master', NULL, NULL, NULL, N'You’ve learned to put the weight of a weapon to your advantage, letting its momentum empower your strikes. You gain the following benefits:
• On your turn, when you score a critical hit with a melee weapon or reduce a creature to 0 hit points with one, you can make one melee weapon attack as a bonus action. • Before you make a melee attack with a heavy weapon that you are proficient with, you can choose to take a -5 penalty to the attack roll. If the attack hits, you add +10 to the attack’s damage.')
INSERT [dbo].[DnD5eFeats] ([FeatID], [FeatName], [StatPrerequisite], [MagicPrerequisite], [ArmorProfPrerequisite], [FeatDescription]) VALUES (8014, N'Healer', NULL, NULL, NULL, N'You are an able physician, allowing you to mend wounds quickly and get your allies back in the fight. You gain the following benefits:
• When you use a healer’s kit to stabilize a dying crea- ture, that creature also regains 1 hit point. • As an action, you can spend one use of a healer’s kit to tend to a creature and restore 1d6 + 4 hit points to it, plus additional hit points equal to the creature’s max- imum number of Hit Dice. The creature can’t regain hit points from this feat again until it finishes a short or long rest.')
INSERT [dbo].[DnD5eFeats] ([FeatID], [FeatName], [StatPrerequisite], [MagicPrerequisite], [ArmorProfPrerequisite], [FeatDescription]) VALUES (8015, N'Heavily Armored', NULL, NULL, N'Heavy', N'Prerequisite: Proficiency with medium armor
You have trained to master the use of heavy armor, gaining the following benefits:
• Increase your Strength score by 1, to a maximum of 20. • You gain proficiency with heavy armor.')
INSERT [dbo].[DnD5eFeats] ([FeatID], [FeatName], [StatPrerequisite], [MagicPrerequisite], [ArmorProfPrerequisite], [FeatDescription]) VALUES (8016, N'Heavy Armor Master', NULL, NULL, N'Heavy', N'Prerequisite: Proficiency with heavy armor
You can use your armor to deflect strikes that would kill others. You gain the following benefits:
• Increase your Strength score by 1, to a maximum of 20. • While you are wearing heavy armor, bludgeoning, piercing, and slashing damage that you take from non magical weapons is reduced by 3.
')
INSERT [dbo].[DnD5eFeats] ([FeatID], [FeatName], [StatPrerequisite], [MagicPrerequisite], [ArmorProfPrerequisite], [FeatDescription]) VALUES (8017, N'Inspiring Leader', N'CHA,13', NULL, NULL, N'Prerequisite: Charisma 13 or higher
You can spend 10 minutes inspiring your companions, shoring up their resolve to fight. When you do so, choose up to six friendly creatures (which can include yourself) within 30 feet of you who can see or hear you and who can understand you. Each creature can gain temporary hit points equal to your level + your Charisma modifier. A creature can’t gain temporary hit points from this feat again until it has finished a short or long rest.')
INSERT [dbo].[DnD5eFeats] ([FeatID], [FeatName], [StatPrerequisite], [MagicPrerequisite], [ArmorProfPrerequisite], [FeatDescription]) VALUES (9007, N'Lucky', NULL, NULL, NULL, N'You have inexplicable luck that seems to kick in at just
the right moment.
You have 3 luck points. Whenever you make an attack
roll, an ability check, or a saving throw, you can spend
one luck point to roll an additional d20. You can choose
to spend one o f your luck points after you roll the die,
but before the outcome is determined. You choose which
o f the d20s is used for the attack roll, ability check, or
saving throw.
You can also spend one luck point when an attack
roll is made against you. Roll a d20, and then choose
whether the attack uses the attacker’s roll or yours.
If more than one creature spends a luck point to
influence the outcome o f a roll, the points cancel each
other out; no additional dice are rolled.
You regain your expended luck points w hen you
finish a long rest.')
INSERT [dbo].[DnD5eFeats] ([FeatID], [FeatName], [StatPrerequisite], [MagicPrerequisite], [ArmorProfPrerequisite], [FeatDescription]) VALUES (9008, N'Dual Wielder', NULL, NULL, NULL, N'You master fighting with two weapons, gaining the
following benefits:
• You gain a +1 bonus to AC while you are wielding a
separate melee weapon in each hand.
• You can use two-weapon fighting even when the onehanded
melee w eapons you are wielding aren’t light.
• You can draw or stow two one-handed weapons when
you w ould normally b e able to draw or stow only one.')
SET IDENTITY_INSERT [dbo].[DnD5eFeats] OFF
SET IDENTITY_INSERT [dbo].[DnD5eItems] ON 

INSERT [dbo].[DnD5eItems] ([ItemID], [ItemName], [ItemDescription], [ItemCost], [ItemWeight]) VALUES (1, N'Abacus', N'You know what a damn Abacus is', 200, 2)
INSERT [dbo].[DnD5eItems] ([ItemID], [ItemName], [ItemDescription], [ItemCost], [ItemWeight]) VALUES (3, N'Alchemist''s fire (flash)', N'This sticky, adhesive fluid ignites
when exposed to air. As an action, you can throw this
flask up to 20 feet, shattering it on impact. Make a
ranged attack against a creature or object, treating the alchemist''s fire as an im provised weapon. On a
hit, the target takes 1d4 fire damage at the start of
each of its turns. A creature can end this dam age by
using its action to make a DC 10 Dexterity check to
extinguish the flames', 5000, 1)
INSERT [dbo].[DnD5eItems] ([ItemID], [ItemName], [ItemDescription], [ItemCost], [ItemWeight]) VALUES (4, N'Arrows (20)', N'You shoot them', 100, 1)
INSERT [dbo].[DnD5eItems] ([ItemID], [ItemName], [ItemDescription], [ItemCost], [ItemWeight]) VALUES (5, N'Orb', N'Arcane Focus', 2000, 3)
INSERT [dbo].[DnD5eItems] ([ItemID], [ItemName], [ItemDescription], [ItemCost], [ItemWeight]) VALUES (6, N'Caltrops', N'As an action, you can spread a single bag
o f caltrops to cover a 5-foot-square area. Any creature
that enters the area must succeed on a DC 15 Dexterity
saving throw or stop moving and take 1 piercing
damage. Until the creature regains at least 1 hit point,
its walking speed is reduced by 10 feet. A creature
moving through the area at half speed doesn’t need to
make the saving throw.', 100, 2)
INSERT [dbo].[DnD5eItems] ([ItemID], [ItemName], [ItemDescription], [ItemCost], [ItemWeight]) VALUES (7, N'Rope, hempen (50 ft)', N'Hempen Rope', 100, 1)
INSERT [dbo].[DnD5eItems] ([ItemID], [ItemName], [ItemDescription], [ItemCost], [ItemWeight]) VALUES (8, N'Burglar''s Pack', N' Includes a backpack, a bag of 1,000
ball bearings, 10 feet of string, a bell, 5 candles, a crowbar, a
hammer, 10 pitons, a hooded lantern, 2 flasks of oil, 5 days
rations, a tinderbox, and a waterskin. The pack also has 50
feet of hempen rope strapped to the side of it.', 1600, NULL)
INSERT [dbo].[DnD5eItems] ([ItemID], [ItemName], [ItemDescription], [ItemCost], [ItemWeight]) VALUES (9, N'Diplomat''s Pack', N' Includes a chest, 2 cases for maps
and scrolls, a set of fine clothes, a bottle of ink, an ink pen,
a lamp, 2 flasks of oil, 5 sheets of paper, a vial of perfume,
sealing wax, and soap', 3900, NULL)
INSERT [dbo].[DnD5eItems] ([ItemID], [ItemName], [ItemDescription], [ItemCost], [ItemWeight]) VALUES (11, N'Dungeoneer''s Pack', N'Includes a backpack, a crowbar,
a hammer, 10 pitons, 10 torches, a tinderbox, 10 days
of rations, and a waterskin. The pack also has 50 feet of
hempen rope strapped to the side of it.', 1200, NULL)
INSERT [dbo].[DnD5eItems] ([ItemID], [ItemName], [ItemDescription], [ItemCost], [ItemWeight]) VALUES (12, N'Entertainer''s Pack', N' Includes a backpack, a bedroll,
2 costumes, 5 candles, 5 days of rations, a waterskin, and a
disguise kit', 4000, NULL)
INSERT [dbo].[DnD5eItems] ([ItemID], [ItemName], [ItemDescription], [ItemCost], [ItemWeight]) VALUES (13, N'Explorer''s Pack', N'Includes a backpack, a bedroll,
a mess kit, a tinderbox, 10 torches, 10 days of rations, and
a waterskin. The pack also has 50 feet of hempen rope
strapped to the side of it.', 1000, NULL)
INSERT [dbo].[DnD5eItems] ([ItemID], [ItemName], [ItemDescription], [ItemCost], [ItemWeight]) VALUES (14, N'Priest''s Pack', N'Includes a backpack, a blanket, 10
candles, a tinderbox, an alms box, 2 blocks of incense, a
censer, vestments, 2 days of rations, and a waterskin.', 1900, NULL)
INSERT [dbo].[DnD5eItems] ([ItemID], [ItemName], [ItemDescription], [ItemCost], [ItemWeight]) VALUES (15, N'Scholar''s Pack', N' Includes a backpack, a book of lore,
a bottle of ink, an ink pen, 10 sheets of parchment, a little
bag of sand, and a small knife', 4000, NULL)
INSERT [dbo].[DnD5eItems] ([ItemID], [ItemName], [ItemDescription], [ItemCost], [ItemWeight]) VALUES (16, N'Backpack', N'1 cubic foot/30 pounds of gear', 200, 5)
INSERT [dbo].[DnD5eItems] ([ItemID], [ItemName], [ItemDescription], [ItemCost], [ItemWeight]) VALUES (17, N'Ball Bearings (bag of 1000)', N'A s an action, you can spill these tiny
metal balls from their pouch to cover a level area 10
feet square. A creature moving across the covered area
must succeed on a DC 10 Dexterity saving throw or fall
prone. A creature moving through the area at half speed
doesn’t need to make the saving throw', 100, 2)
INSERT [dbo].[DnD5eItems] ([ItemID], [ItemName], [ItemDescription], [ItemCost], [ItemWeight]) VALUES (18, N'String (10ft)', N'Its string.', 2, 0)
INSERT [dbo].[DnD5eItems] ([ItemID], [ItemName], [ItemDescription], [ItemCost], [ItemWeight]) VALUES (20, N'Bell', N'Ring ring', 100, 0)
INSERT [dbo].[DnD5eItems] ([ItemID], [ItemName], [ItemDescription], [ItemCost], [ItemWeight]) VALUES (21, N'Candle', N'Probably made from ear wax', 100, 0)
INSERT [dbo].[DnD5eItems] ([ItemID], [ItemName], [ItemDescription], [ItemCost], [ItemWeight]) VALUES (22, N'Crowbar', N'Using a crowbar grants advantage
to Strength checks where the crow bar’s leverage
can be applied.', 200, 5)
INSERT [dbo].[DnD5eItems] ([ItemID], [ItemName], [ItemDescription], [ItemCost], [ItemWeight]) VALUES (23, N'Hammer', N'It hits stuff', 100, 3)
INSERT [dbo].[DnD5eItems] ([ItemID], [ItemName], [ItemDescription], [ItemCost], [ItemWeight]) VALUES (24, N'Piton', N'Use em to climb up stuff', 5, NULL)
INSERT [dbo].[DnD5eItems] ([ItemID], [ItemName], [ItemDescription], [ItemCost], [ItemWeight]) VALUES (25, N'Lantern, Hooded', N'Lantern, Hooded. A hooded lantern casts bright light
in a 30-foot radius and dim light for an additional 30
feet. Once lit, it burns for 6 hours on a flask (1 pint) of
oil. As an action, you can lower the hood, reducing the
light to dim light in a 5-foot radius.', 500, 2)
INSERT [dbo].[DnD5eItems] ([ItemID], [ItemName], [ItemDescription], [ItemCost], [ItemWeight]) VALUES (26, N'Flask of Oil', N'Oil usually com es in a clay flask that holds 1
pint. As an action, you can splash the oil in this flask
onto a creature within 5 feet of you or throw it up to
20 feet, shattering it on impact. Make a ranged attack
against a target creature or object, treating the oil as
an im provised weapon. On a hit, the target is covered
in oil. If the target takes any fire damage before the oil
dries (after 1 minute), the target takes an additional 5
fire damage from the burning oil. You can also pour a
flask of oil on the ground to cover a 5-foot-square area,
provided that the surface is level. If lit, the oil burns for
2 rounds and deals 5 fire damage to any creature that
enters the area or ends its turn in the area. A creature
can take this damage only once per turn.', 10, 1)
INSERT [dbo].[DnD5eItems] ([ItemID], [ItemName], [ItemDescription], [ItemCost], [ItemWeight]) VALUES (27, N'Rations (1 day)', N'Rations consist of dry foods suitable
for extended travel, including jerky, dried fruit,
hardtack, and nuts.', 50, 2)
INSERT [dbo].[DnD5eItems] ([ItemID], [ItemName], [ItemDescription], [ItemCost], [ItemWeight]) VALUES (28, N'Tinderbox', N'This small container holds flint, fire steel,
and tinder (usually dry cloth soaked in light oil) used to
kindle a fire. Using it to light a torch—or anything else
with abundant, exposed fuel—takes an action. Lighting
any other fire takes 1 minute.', 50, 1)
INSERT [dbo].[DnD5eItems] ([ItemID], [ItemName], [ItemDescription], [ItemCost], [ItemWeight]) VALUES (29, N'Waterskin', N'4 pints liquid', 20, 5)
INSERT [dbo].[DnD5eItems] ([ItemID], [ItemName], [ItemDescription], [ItemCost], [ItemWeight]) VALUES (30, N'Potion of Healing', N'A character w ho drinks the magical
red fluid in this vial regains 2d4 + 2 hit points. Drinking
or administering a potion takes an action.', 5000, 1)
SET IDENTITY_INSERT [dbo].[DnD5eItems] OFF
SET IDENTITY_INSERT [dbo].[DnD5eRaces] ON 

INSERT [dbo].[DnD5eRaces] ([RaceID], [BaseRaceName], [StrengthIncrease], [DexterityIncrease], [ConstitutionIncrease], [WisdomIncrease], [CharismaIncrease], [IntelligenceIncrease], [Languages], [Abilities], [Age], [Alignment], [Size], [Speed]) VALUES (1, N'Dwarf', 0, 0, 2, 0, 0, 0, N'Dwarven, Common', N'Darkvision. A ccustom ed to life underground, you
have superior vision in dark and dim conditions. You
can see in dim light within 60 feet of you as if it were
bright light, and in darkness as if it w ere dim light. You
can’t discern color in darkness, only shades of gray.
Dwarven Resilience. You have advantage on saving
throws against poison, and you have resistance against
poison damage (explained in chapter 9).
Dwarven Combat Training. You have proficiency
with the battleaxe, handaxe, throwing hammer,
and warhammer.', N'Age. D warves mature at the sam e rate as humans, but
they’re considered young until they reach the age of 50.
On average, they live about 350 years. Tool Proficiency. You gain proficiency with the
artisan’s tools of your choice: smith’s tools, brew er’s
supplies, or m ason’s tools.
Stonecunning. W henever you make an Intelligence
(History) check related to the origin of stonework, you
are considered proficient in the History skill and add
double your proficiency bonus to the check, instead of
your norm al proficiency bonus.', N'Alignment. M ost dwarves are lawful, believing firmly
in the benefits of a well-ordered society. They tend
toward good as well, with a strong sense of fair play and
a belief that everyone deserves to share in the benefits of
a just order.', N'Size. D warves stand between 4 and 5 feet tall and
average about 150 pounds. Your size is Medium', 30)
INSERT [dbo].[DnD5eRaces] ([RaceID], [BaseRaceName], [StrengthIncrease], [DexterityIncrease], [ConstitutionIncrease], [WisdomIncrease], [CharismaIncrease], [IntelligenceIncrease], [Languages], [Abilities], [Age], [Alignment], [Size], [Speed]) VALUES (2, N'Elf', 0, 2, 0, 0, 0, 0, N'Languages. You can speak, read, and write Com m on
and Elvish. Elvish is fluid, with subtle intonations and
intricate grammar. Elven literature is rich and varied,
and their songs and poem s are fam ous am ong other
races. Many bards learn their language so they can add
Elvish ballads to their repertoires.', N'Darkvision. Accustom ed to twilit forests and the night
sky, you have superior vision in dark and dim conditions.
You can see in dim light within 60 feet of you as if it
w ere bright light, and in darkness as if it were dim light.
You can’t discern color in darkness, only shades of gray.
Keen Senses. You have proficiency in the
Perception skill.
Fey Ancestry. You have advantage on saving throws
against being charm ed, and m agic can’t put you to sleep. Trance. Elves don’t need to sleep. Instead, they
meditate deeply, remaining sem iconscious, for 4
hours a day. (The Com m on w ord for such meditation
is “trance.”) W hile meditating, you can dream after a
fashion; such dream s are actually mental exercises that
have becom e reflexive through years of practice. After
resting in this way, you gain the sam e benefit that a
human does from 8 hours of sleep.', N'Age. Although elves reach physical maturity at about
the sam e age as humans, the elven understanding of
adulthood goes beyond physical growth to encom pass
worldly experience. An elf typically claim s adulthood
and an adult name aro', N'Alignment. Elves love freedom , variety, and selfexpression, so they lean strongly toward the gentler
aspects of chaos. They value and protect others''
freedom as well as their own, and they are more
often good than not. The drow are an exception; their
exile into the Underdark has made them vicious and
dangerous. D row are m ore often evil than not', N'Size. Elves range from under 5 to over 6 feet tall and
have slender builds. Your size is Medium.', 30)
INSERT [dbo].[DnD5eRaces] ([RaceID], [BaseRaceName], [StrengthIncrease], [DexterityIncrease], [ConstitutionIncrease], [WisdomIncrease], [CharismaIncrease], [IntelligenceIncrease], [Languages], [Abilities], [Age], [Alignment], [Size], [Speed]) VALUES (3, N'Halfling', 0, 2, 0, 0, 0, 0, N'Languages. You can speak, read, and write Com m on
and Halfling. The Halfling language isn’t secret, but
halflings are loath to share it with others. They write
very little, so they don’t have a rich body o f literature.
Their oral tradition, however, is very strong. Alm ost all
halflings speak Com m on to converse with the people
in w hose lands they dwell or through which they
are traveling.', N'Lucky. W hen you roll a 1 on an attack roll, ability
check, or saving throw, you can reroll the die and must
use the new roll.
Brave. You have advantage on saving throws against
being frightened.
Halfling Nimbleness. You can move through the
space of any creature that is of a size larger than yours.ULL', N'Age. A halfling reaches adulthood at the age of
20 and generally lives into the middle of his or her
second century.', N'Alignment. M ost halflings are lawful good. As a rule,
they are good-hearted and kind, hate to see others in
pain, and have no tolerance for oppression. They are
also very orderly and traditional, leaning heavily on
the support of their com m unity and the com fort of
their old ways.', N'Size. Halflings average about 3 feet tall and weigh
about 40 pounds. Your size is Small.', 25)
INSERT [dbo].[DnD5eRaces] ([RaceID], [BaseRaceName], [StrengthIncrease], [DexterityIncrease], [ConstitutionIncrease], [WisdomIncrease], [CharismaIncrease], [IntelligenceIncrease], [Languages], [Abilities], [Age], [Alignment], [Size], [Speed]) VALUES (4, N'Human', 1, 1, 1, 1, 1, 1, N'Languages. You can speak, read, and write Com m on
and one extra language of your choice. Humans typically
learn the languages of other peoples they deal with,
including obscure dialects. They are fond of sprinkling
their speech with w ords borrow ed from other tongues:
Orc curses, Elvish musical expressions, Dwarvish
military phrases, and so on.', NULL, N'Age. Humans reach adulthood in their late teens and
live less than a century', N'Alignment. Humans tend toward no
particular alignment. The best and the worst are
found am ong them.', N'Size. Humans vary widely in height and build, from
barely 5 feet to well over 6 feet tall. Regardless of your
position in that range, your size is Medium.', 30)
INSERT [dbo].[DnD5eRaces] ([RaceID], [BaseRaceName], [StrengthIncrease], [DexterityIncrease], [ConstitutionIncrease], [WisdomIncrease], [CharismaIncrease], [IntelligenceIncrease], [Languages], [Abilities], [Age], [Alignment], [Size], [Speed]) VALUES (5, N'Dragonborn', 2, 0, 0, 0, 1, 0, N'Languages. You can speak, read, and write Com m on
and D raconic. D raconic is thought to be one of the
oldest languages and is often used in the study of magic.
The language sounds harsh to m ost other creatures and
includes num erous hard consonants and sibilants.', N'Draconic Ancestry. You have draconic ancestry.
C hoose one type of dragon from the D raconic Ancestry
table. Your breath weapon and damage resistance are
determined by the dragon type, as show n in the table.
Breath Weapon. You can use your action to exhale
destructive energy. Your draconic ancestry determines
the size, shape, and damage type of the exhalation.
W hen you use your breath weapon, each creature in
the area of the exhalation must make a saving throw,
the type of which is determined by your draconic
ancestry. The DC for this saving throw equals 8 +
your Constitution m odifier + your proficiency bonus. A
creature takes 2d6 damage on a failed save, and half
as much damage on a successful one. The damage
increases to 3d6 at 6th level, 4d6 at 11th level, and 5d6
at 16th level.
After you use your breath weapon, you can’t use it
again until you com plete a short or long rest.
Damage Resistance. You have resistance to the
damage type associated with your draconic ancestry', N'Age. Young dragonborn grow quickly. They walk
hours after hatching, attain the size and development
of a 10-year-old human child by the age of 3, and reach
adulthood by 15. They live to be around 80.', N'Alignment. Dragonborn tend to extremes, making a
conscious choice for one side or the other in the cosm ic
war between good and evil (represented by Bahamut
and Tiamat, respectively). Most dragonborn are good,
but those w ho side with Tiamat can be terrible villains.', N'Size. Dragonborn are taller and heavier than humans,
standing well over 6 feet tall and averaging almost 250
pounds. Your size is Medium.', 30)
INSERT [dbo].[DnD5eRaces] ([RaceID], [BaseRaceName], [StrengthIncrease], [DexterityIncrease], [ConstitutionIncrease], [WisdomIncrease], [CharismaIncrease], [IntelligenceIncrease], [Languages], [Abilities], [Age], [Alignment], [Size], [Speed]) VALUES (6, N'Gnome', 0, 0, 0, 0, 0, 2, N'Languages. You can speak, read, and write Com m on
and Gnomish. The Gnom ish language, which uses the
Dwarvish script, is renow ned for its technical treatises
and its catalogs o f knowledge about the natural world.', N'Darkvision. Accustom ed to life underground, you have
superior vision in dark and dim conditions. You can
see in dim light within 60 feet of you as if it w ere bright
light, and in darkness as if it were dim light. You can''t
discern color in darkness, only shades of gray.
Gnome Cunning. You have advantage on all
Intelligence, W isdom , and Charisma saving throws
against magic.', N'Age. G nom es mature at the sam e rate humans do, and
m ost are expected to settle down into an adult life by
around age 40. They can live 350 to almost 500 years.', N'Alignment. Gnom es are most often good. T hose who
tend toward law are sages, engineers, researchers,
scholars, investigators, or inventors. T hose w ho tend
toward chaos are minstrels, tricksters, wanderers,
or fanciful jew elers. G nom es are good-hearted, and even the tricksters am ong them are m ore playful
than vicious.', N'Size. Gnom es are between 3 and 4 feet tall and
average about 40 pounds. Your size is Small.', 25)
INSERT [dbo].[DnD5eRaces] ([RaceID], [BaseRaceName], [StrengthIncrease], [DexterityIncrease], [ConstitutionIncrease], [WisdomIncrease], [CharismaIncrease], [IntelligenceIncrease], [Languages], [Abilities], [Age], [Alignment], [Size], [Speed]) VALUES (7, N'Half-Elf', 0, 0, 0, 0, 2, 0, N'Languages. You can speak, read, and write Com m on,
Elvish, and one extra language of your choice.', N'Darkvision. Thanks to your elf blood, you have
superior vision in dark and dim conditions. You can
see in dim light within 60 feet of you as if it w ere bright
light, and in darkness as if it were dim light. You can’t
discern color in darkness, only shades of gray.
Fey Ancestry. You have advantage on saving throws
against being charm ed, and m agic can’t put you to sleep.
Skill Versatility. You gain proficiency in two skills
of your choice.', N'Age. Half-elves mature at the sam e rate humans
do and reach adulthood around the age o f 20. They
live much longer than humans, however, often
exceeding 180 years.', N'Alignment. Half-elves share the chaotic bent of their
elven heritage. They value both personal freedom and creative expression, demonstrating neither love
of leaders nor desire for followers. They chafe at
rules, resent others’ demands, and som etim es prove
unreliable, or at least unpredictable.', N'Size. Half-elves are about the same size as humans,
ranging from 5 to 6 feet tall. Your size is Medium.', 30)
INSERT [dbo].[DnD5eRaces] ([RaceID], [BaseRaceName], [StrengthIncrease], [DexterityIncrease], [ConstitutionIncrease], [WisdomIncrease], [CharismaIncrease], [IntelligenceIncrease], [Languages], [Abilities], [Age], [Alignment], [Size], [Speed]) VALUES (8, N'Half-Orc', 2, 0, 1, 0, 0, 0, N'Languages. You can speak, read, and
write Com m on and Orc . Orc is a
harsh, grating language with
hard consonants. It has
no script of its own
but is written in the
Dwarvish script.', N'Darkvision. Thanks to your orc blood, you have
superior vision in dark and dim conditions. You can
see in dim light within 60 feet of you as if it w ere bright
light, and in darkness as if it w ere dim light. You can''t
discern color in darkness, only shades o f gray.
Menacing. You gain proficiency in the
Intimidation skill.
Relentless Endurance. W hen you are reduced to
0 hit points but not killed outright, you can drop to 1 hit
point instead. You can’t use this feature again until you
finish a long rest.
Savage Attacks. W hen you score a critical hit with
a melee weapon attack, you can roll one of the w eapon’s
damage dice one additional time and add it to the extra
damage of the critical hit', N'Age. Half-orcs mature a little faster than humans,
reaching adulthood around age 14. They age
noticeably faster and rarely live longer than 75 years.', N'Alignment. H alf-orcs inherit a tendency toward chaos
from their orc parents and are not strongly inclined
toward good. Half-orcs raised am ong ores and willing
to live out their lives am ong them are usually evil', N'Size. H alf-orcs are som ewhat larger and bulkier than
humans, and they range from 5 to well over 6 feet tall.
Your size is Medium', 30)
INSERT [dbo].[DnD5eRaces] ([RaceID], [BaseRaceName], [StrengthIncrease], [DexterityIncrease], [ConstitutionIncrease], [WisdomIncrease], [CharismaIncrease], [IntelligenceIncrease], [Languages], [Abilities], [Age], [Alignment], [Size], [Speed]) VALUES (9, N'Tiefling', 0, 0, 0, 0, 2, 1, N'Languages. You can speak, read, and write Com m on
and Infernal.', N'Darkvision. Thanks to your infernal heritage, you
have superior vision in dark and dim conditions. You
can see in dim light within 60 feet of you as if it were
bright light, and in darkness as if it w ere dim light. You
can’t discern color in darkness, only shades o f gray.
Hellish Resistance. You have resistance
to fire damage.
Infernal Legacy. You know the thaumaturgy cantrip.
Once you reach 3rd level, you can cast the hellish
rebuke spell once per day as a 2nd-level spell. O nce you
reach 5th level, you can also cast the darkness spell
once per day. Charisma is your spellcasting ability for
these spells.', N'Age. Tieflings mature at the sam e rate as humans but
live a few years longer', N'Alignment. Tieflings might not have an innate
tendency toward evil, but many of them end up there.
Evil or not, an independent nature inclines many
tieflings toward a chaotic alignment', N'Size. Tieflings are about the sam e size and build as
humans. Your size is Medium.', 30)
SET IDENTITY_INSERT [dbo].[DnD5eRaces] OFF
SET IDENTITY_INSERT [dbo].[DnD5eSkills] ON 

INSERT [dbo].[DnD5eSkills] ([SkillID], [SkillName], [BaseStat], [SkillDescription]) VALUES (1, N'Athletics', N'Strength', N' Your Strength (Athletics) check covers
difficult situations you encounter while climbing,
jumping, or swim ming. Exam ples include the
following activities:
• You attempt to climb a sheer or slippery cliff, avoid
hazards while scaling a wall, or cling to a surface
while som ething is trying to knock you off.
• You try to jum p an unusually long distance or pull
off a stunt midjump.
• You struggle to sw im or stay afloat in treacherous currents, storm -tossed waves, or areas o f thick seaweed.
Or another creature tries to push or pull you underwater or otherwise interfere with your swimming.')
INSERT [dbo].[DnD5eSkills] ([SkillID], [SkillName], [BaseStat], [SkillDescription]) VALUES (2, N'Acrobatics', N'Dexterity', N'Your Dexterity (Acrobatics) check covers
your attempt to stay on your feet in a tricky situation,
such as w hen you’re trying to run across a sheet o f ice,
balance on a tightrope, or stay upright on a rocking
ship’s deck. The DM might also call for a Dexterity
(Acrobatics) check to see if you can perform acrobatic
stunts, including dives, rolls, somersaults, and flips.')
INSERT [dbo].[DnD5eSkills] ([SkillID], [SkillName], [BaseStat], [SkillDescription]) VALUES (3, N'Sleight of Hand', N'Dexterity', N'W henever you attempt an act of
legerdemain or manual trickery, such as planting
som ething on som eone else or concealing an object on
your person, make a Dexterity (Sleight o f Hand) check.
The DM might also call for a Dexterity (Sleight of Hand)
check to determine whether you can lift a coin purse off
another person or slip som ething out of another
person’s pocket.')
INSERT [dbo].[DnD5eSkills] ([SkillID], [SkillName], [BaseStat], [SkillDescription]) VALUES (4, N'Stealth', N'Dexterity', N'Make a Dexterity (Stealth) check when you
attempt to conceal yourself from enemies, slink past
guards, slip away without being noticed, or sneak up on
som eone without being seen or heard.')
INSERT [dbo].[DnD5eSkills] ([SkillID], [SkillName], [BaseStat], [SkillDescription]) VALUES (5, N'Arcana', N'Intelligence', N'Your Intelligence (Arcana) check m easures
your ability to recall lore about spells, m agic items,
eldritch symbols, magical traditions, the planes of
existence, and the inhabitants of those planes.')
INSERT [dbo].[DnD5eSkills] ([SkillID], [SkillName], [BaseStat], [SkillDescription]) VALUES (6, N'History', N'Intelligence', N' Your Intelligence (History) check m easures
your ability to recall lore about historical events,
legendary people, ancient kingdom s, past disputes,
recent wars, and lost civilizations.')
INSERT [dbo].[DnD5eSkills] ([SkillID], [SkillName], [BaseStat], [SkillDescription]) VALUES (7, N'Investigation', N'Intelligence', N' W hen you look around for clues and
make deductions based on those clues, you make an
Intelligence (Investigation) check. You might deduce the
location of a hidden object, discern from the appearance
o f a wound what kind of weapon dealt it, or determine
the w eakest point in a tunnel that could cause it to
collapse. Poring through ancient scrolls in search of
a hidden fragment of knowledge might also call for an
Intelligence (Investigation) check.')
INSERT [dbo].[DnD5eSkills] ([SkillID], [SkillName], [BaseStat], [SkillDescription]) VALUES (8, N'Nature', N'Intelligence', N'Your Intelligence (Nature) check m easures
your ability to recall lore about terrain, plants and
animals, the weather, and natural cycles.')
INSERT [dbo].[DnD5eSkills] ([SkillID], [SkillName], [BaseStat], [SkillDescription]) VALUES (9, N'Religion', N'Intelligence', N'Your Intelligence (Religion) check m easures
your ability to recall lore about deities, rites and prayers,
religious hierarchies, holy sym bols, and the practices
of secret cults')
INSERT [dbo].[DnD5eSkills] ([SkillID], [SkillName], [BaseStat], [SkillDescription]) VALUES (10, N'Animal Handling', N'Wisdom', N'. W hen there is any question
whether you can calm down a dom esticated animal,
keep a mount from getting spooked, or intuit an animal’s
intentions, the DM might call for a W isdom (Animal
Handling) check. You also make a W isdom (Animal
Handling) check to control your mount when you attempt
a risky maneuver')
INSERT [dbo].[DnD5eSkills] ([SkillID], [SkillName], [BaseStat], [SkillDescription]) VALUES (11, N'Insight', N'Wisdom', N'. Your W isdom (Insight) check decides whether
you can determine the true intentions of a creature, such
as w hen searching out a lie or predicting som eone’s
next move. D oing so involves gleaning clues from body
language, speech habits, and changes in mannerism s')
INSERT [dbo].[DnD5eSkills] ([SkillID], [SkillName], [BaseStat], [SkillDescription]) VALUES (12, N'Medicine', N'Wisdom', N'A W isdom (M edicine) check lets you try to
stabilize a dying com panion or diagnose an illness')
INSERT [dbo].[DnD5eSkills] ([SkillID], [SkillName], [BaseStat], [SkillDescription]) VALUES (13, N'Perception', N'Wisdom', N'Your W isdom (Perception) check lets
you spot, hear, or otherwise detect the presence of
something. It m easures your general awareness of
your surroundings and the keenness of your senses. For example, you might try to hear a conversation
through a closed door, eavesdrop under an open window,
or hear monsters moving stealthily in the forest. Or you
might try to spot things that are obscured or easy to
miss, whether they are orcs lying in ambush on a road,
thugs hiding in the shadows of an alley, or candlelight
under a closed secret door.')
INSERT [dbo].[DnD5eSkills] ([SkillID], [SkillName], [BaseStat], [SkillDescription]) VALUES (14, N'Survival', N'Wisdom', N'The DM might ask you to make a W isdom
(Survival) check to follow tracks, hunt wild game, guide
your group through frozen wastelands, identify signs
that ow lbears live nearby, predict the weather, or avoid
quicksand and other natural hazards.')
INSERT [dbo].[DnD5eSkills] ([SkillID], [SkillName], [BaseStat], [SkillDescription]) VALUES (15, N'Deception', N'Charisma', N' Your Charisma (D eception) check
determines whether you can convincingly hide the
truth, either verbally or through your actions. This
deception can encom pass everything from misleading
others through ambiguity to telling outright lies. Typical
situations include trying to fast-talk a guard, con a
merchant, earn money through gambling, pass yourself
off in a disguise, dull som eone’s suspicions with false
assurances, or maintain a straight face while telling
a blatant lie.')
INSERT [dbo].[DnD5eSkills] ([SkillID], [SkillName], [BaseStat], [SkillDescription]) VALUES (16, N'Intimidation', N'Charisma', N'W hen you attempt to influence som eone
through overt threats, hostile actions, and physical
violence, the DM might ask you to make a Charisma
(Intimidation) check. Exam ples include trying to pry
information out of a prisoner, convincing street thugs
to back dow n from a confrontation, or using the edge of
a broken bottle to convince a sneering vizier to
reconsider a decision')
INSERT [dbo].[DnD5eSkills] ([SkillID], [SkillName], [BaseStat], [SkillDescription]) VALUES (17, N'Performance', N'Charisma', N'Your Charisma (Perform ance) check
determines how well you can delight an audience with
music, dance, acting, storytelling, or som e other form of
entertainment.')
INSERT [dbo].[DnD5eSkills] ([SkillID], [SkillName], [BaseStat], [SkillDescription]) VALUES (18, N'Persuasion', N'Charisma', N'W hen you attempt to influence som eone
or a group o f people with tact, social graces, or good
nature, the DM might ask you to make a Charisma
(Persuasion) check. Typically, you use persuasion when
acting in good faith, to foster friendships, make cordial
requests, or exhibit proper etiquette. Exam ples of
persuading others include convincing a chamberlain to
let your party see the king, negotiating peace between
warring tribes, or inspiring a crow d of townsfolk.')
SET IDENTITY_INSERT [dbo].[DnD5eSkills] OFF
SET IDENTITY_INSERT [dbo].[DnD5eSpells] ON 

INSERT [dbo].[DnD5eSpells] ([SpellID], [Name], [School], [CastingTime], [SpellLevel], [Components], [Range], [SpellMaterials], [SpellDescription], [Duration], [RitualFlag], [RequiresConcentration]) VALUES (1, N'Acid Splash', N'Conjuration', N'1 action', 0, N'V,S', N'60        ', NULL, N'You hurl a bubble of acid. Choose one creature within
range, or choose two creatures within range that are
within 5 feet o f each other. A target must succeed on a
Dexterity saving throw or take 1d6 acid damage.
This spell’s damage increases by 1d6 when you reach
5th level (2d6), 11th level (3d6), and 17th level (4d6).', N'Instantaneous', 0, 0)
INSERT [dbo].[DnD5eSpells] ([SpellID], [Name], [School], [CastingTime], [SpellLevel], [Components], [Range], [SpellMaterials], [SpellDescription], [Duration], [RitualFlag], [RequiresConcentration]) VALUES (2, N'Aid', N'Adjuration', N'1 action', 2, N'V,S,M', N'30        ', N'a tiny scrip of white cloth', N'Your spell bolsters your allies with toughness and
resolve. Choose up to three creatures within range.
Each target’s hit point maximum and current hit points
increase by 5 for the duration.
At Higher Levels. When you cast this spell using
a spell slot o f 3rd level or higher, a target’s hit points
increase by an additional 5 for each slot level above 2nd.', N'8 hours', 0, 0)
INSERT [dbo].[DnD5eSpells] ([SpellID], [Name], [School], [CastingTime], [SpellLevel], [Components], [Range], [SpellMaterials], [SpellDescription], [Duration], [RitualFlag], [RequiresConcentration]) VALUES (3, N'Alarm', N'Adjuration', N'1 minute', 1, N'V,S,M', N'30        ', N'a tiny bell and a piece of fine silver wire', N'You set an alarm against unwanted intrusion. Choose
a door, a window, or an area within range that is no
larger than a 20-foot cube. Until the spell ends, an alarm
alerts you whenever a Tiny or larger creature touches
or enters the w arded area. When you cast the spell, you
can designate creatures that w on’t set off the alarm. You
also choose whether the alarm is mental or audible.
A mental alarm alerts you with a ping in your mind
if you are within 1 mile o f the warded area. This ping
awakens you if you are sleeping.
An audible alarm produces the sound o f a hand bell
for 10 seconds within 60 feet.', N'8 hours', NULL, 0)
INSERT [dbo].[DnD5eSpells] ([SpellID], [Name], [School], [CastingTime], [SpellLevel], [Components], [Range], [SpellMaterials], [SpellDescription], [Duration], [RitualFlag], [RequiresConcentration]) VALUES (4, N'Alter Self', N'Transmutation', N'1 action', 2, N'V,S', N'Self      ', NULL, N'You assume a different form. When you cast the spell,
choose one o f the following options, the effects o f which
last for the duration o f the spell. While the spell lasts,
you can end one option as an action to gain the benefits
o f a different one.
Aquatic Adaptation. You adapt your body to an
aquatic environment, sprouting gills and growing
webbing between your fingers. You can breathe
underwater and gain a swimming speed equal to your
walking speed.
Change Appearance. You transform your appearance.
You decide what you look like, including your height,
weight, facial features, sound o f your voice, hair length,
coloration, and distinguishing characteristics, if any.
You can make yourself appear as a member o f another
race, though none o f your statistics change. You also
can’t appear as a creature o f a different size than you,
and your basic shape stays the same; if you''re bipedal,
you can’t use this spell to become quadrupedal, for
instance. At any time for the duration of the spell, you
can use your action to change your appearance in
this way again.
Natural Weapons. You grow claws, fangs, spines,
horns, or a different natural w eapon o f your choice. Your
unarmed strikes deal 1d6 bludgeoning, piercing, or
slashing damage, as appropriate to the natural weapon
you chose, and you are proficient with your unarmed
strikes. Finally, the natural weapon is magic and you
have a +1 bonus to the attack and damage rolls you
make using it.', N'1 hour', 0, 1)
INSERT [dbo].[DnD5eSpells] ([SpellID], [Name], [School], [CastingTime], [SpellLevel], [Components], [Range], [SpellMaterials], [SpellDescription], [Duration], [RitualFlag], [RequiresConcentration]) VALUES (5, N'Animal Friendship', N'Enchantment', N'1 action', 1, N'V,S,M', N'30        ', N'a morsel of food', N'This spell lets you convince a beast that you mean it no
harm. Choose a beast that you can see within range.
It must see and hear you. If the beast’s Intelligence is
4 or higher, the spell fails. Otherwise, the beast must
succeed on a W isdom saving throw or be charmed
by you for the spell’s duration. If you or one of your
companions harms the target, the spells ends.
At Higher Levels. When you cast this spell using
a spell slot o f 2nd level or higher, you can affect one
additional beast for each slot level above 1st.', N'24 hours', 0, 0)
INSERT [dbo].[DnD5eSpells] ([SpellID], [Name], [School], [CastingTime], [SpellLevel], [Components], [Range], [SpellMaterials], [SpellDescription], [Duration], [RitualFlag], [RequiresConcentration]) VALUES (6, N'Animal Messenger', N'Enchantment', N'1 action', 2, N'V,S,M', N'30        ', N'a morsel of food', N'By means o f this spell, you use an animal to deliver a
message. Choose a Tiny beast you can see within range,
such as a squirrel, a blue jay, or a bat. You specify a
location, which you must have visited, and a recipient
who matches a general description, such as “a man or
woman dressed in the uniform o f the town guard” or “a
red-haired dwarf wearing a pointed hat.” You also speak
a message o f up to twenty-five words. The target beast
travels for the duration o f the spell toward the specified location, covering about 50 miles per 24 hours for a
flying messenger, or 25 miles for other animals.
When the messenger arrives, it delivers your m essage
to the creature that you described, replicating the sound
o f your voice. The messenger speaks only to a creature
matching the description you gave. If the messenger
doesn’t reach its destination before the spell ends, the
message is lost, and the beast makes its way back to
where you cast this spell.
At Higher Levels. If you cast this spell using a spell
slot o f 3nd level or higher, the duration o f the spell
increases by 48 hours for each slot level above 2nd.', N'24 hours', 1, 0)
INSERT [dbo].[DnD5eSpells] ([SpellID], [Name], [School], [CastingTime], [SpellLevel], [Components], [Range], [SpellMaterials], [SpellDescription], [Duration], [RitualFlag], [RequiresConcentration]) VALUES (7, N'Animate Dead', N'Necromancy', N'1 minute', 3, N'V,S,M', N'10        ', N'a drop of blood, a piece of flesh, and a pinch of done dust', N'This spell creates an undead servant. Choose a pile
o f bones or a corpse o f a Medium or Small humanoid
within range. Your spell imbues the target with a foul
mimicry o f life, raising it as an undead creature. The
target becomes a skeleton if you chose bones or a
zombie if you chose a corpse (the DM has the creature’s
game statistics).
On each o f your turns, you can use a bonus action
to mentally command any creature you made with
this spell if the creature is within 60 feet o f you (if you
control multiple creatures, you can command any or all
o f them at the same time, issuing the same command to
each one). You decide what action the creature will take
and where it w ill move during its next turn, or you can
issue a general command, such as to guard a particular
chamber or corridor. If you issue no commands, the
creature only defends itself against hostile creatures.
Once given an order, the creature continues to follow it
until its task is complete.
The creature is under your control for 24 hours,
after which it stops obeying any command you’ve given
it. To maintain control o f the creature for another
24 hours, you must cast this spell on the creature
again before the current 24-hour period ends. This
use o f the spell reasserts your control over up to four
creatures you have animated with this spell, rather than
animating a new one.
At Higher Levels. When you cast this spell using a
spell slot o f 4th level or higher, you animate or reassert
control over two additional undead creatures for each
slot level above 3rd. Each o f the creatures must come
from a different corpse or pile o f bones.', N'Instantaneous', 0, 0)
SET IDENTITY_INSERT [dbo].[DnD5eSpells] OFF
SET IDENTITY_INSERT [dbo].[DnD5eSubclass] ON 

INSERT [dbo].[DnD5eSubclass] ([SubclassID], [ClassID], [Name], [ClassLevelChosen], [Description]) VALUES (1, 1, N'Path of the Berseker', 3, N'For som e barbarians, rage is a means to an end-—that
end being violence. The Path of the Berserker is a path
of untrammeled fury, slick with blood. As you enter
the berserker’s rage, you thrill in the chaos of battle,
heedless of your own health or well-being.')
INSERT [dbo].[DnD5eSubclass] ([SubclassID], [ClassID], [Name], [ClassLevelChosen], [Description]) VALUES (2, 1, N'Path of the Totem Warrior (Bear)', 3, N'The Path of the Totem W arrior is a spiritual journey, as
the barbarian accepts a spirit animal as guide, protector,
and inspiration. In battle, your totem spirit fills you
with supernatural might, adding magical fuel to your
barbarian rage.
Most barbarian tribes consider a totem animal to be
kin to a particular clan. In such cases, it is unusual for
an individual to have more than one totem animal spirit,
though exceptions exist.')
INSERT [dbo].[DnD5eSubclass] ([SubclassID], [ClassID], [Name], [ClassLevelChosen], [Description]) VALUES (4, 1, N'Path of the Totem Warrior (Eagle)', 3, N'The Path of the Totem W arrior is a spiritual journey, as
the barbarian accepts a spirit animal as guide, protector,
and inspiration. In battle, your totem spirit fills you
with supernatural might, adding magical fuel to your
barbarian rage.
Most barbarian tribes consider a totem animal to be
kin to a particular clan. In such cases, it is unusual for
an individual to have more than one totem animal spirit,
though exceptions exist.')
INSERT [dbo].[DnD5eSubclass] ([SubclassID], [ClassID], [Name], [ClassLevelChosen], [Description]) VALUES (5, 1, N'Path of the Totem Warrior (Wolf)', 3, N'The Path of the Totem W arrior is a spiritual journey, as
the barbarian accepts a spirit animal as guide, protector,
and inspiration. In battle, your totem spirit fills you
with supernatural might, adding magical fuel to your
barbarian rage.
Most barbarian tribes consider a totem animal to be
kin to a particular clan. In such cases, it is unusual for
an individual to have more than one totem animal spirit,
though exceptions exist.')
INSERT [dbo].[DnD5eSubclass] ([SubclassID], [ClassID], [Name], [ClassLevelChosen], [Description]) VALUES (6, 2, N'College of Lore', 3, N'Bards of the College o f Lore know som ething about
m ost things, collecting bits of knowledge from sources
as diverse as scholarly tom es and peasant tales.
W hether singing folk ballads in taverns or elaborate
com positions in royal courts, these bards use their gifts
to hold audiences spellbound. W hen the applause dies
down, the audience m em bers might find themselves
questioning everything they held to be true, from their
faith in the priesthood of the local temple to their
loyalty to the king.
The loyalty of these bards lies in the pursuit of beauty
and truth, not in fealty to a m onarch or following the
tenets of a deity. A noble w ho keeps such a bard as a
herald or advisor knows that the bard w ould rather be
honest than politic.
The college’s m em bers gather in libraries and
som etim es in actual colleges, com plete with classroom s
and dormitories, to share their lore with one another.
They also meet at festivals or affairs of state, where they
can expose corruption, unravel lies, and poke fun at selfimportant figures of authority.')
INSERT [dbo].[DnD5eSubclass] ([SubclassID], [ClassID], [Name], [ClassLevelChosen], [Description]) VALUES (7, 2, N'College of Valor', 3, N'Bards of the College of Valor are daring skalds w hose
tales keep alive the m em ory of the great heroes of the
past, and thereby inspire a new generation of heroes.
These bards gather in mead halls or around great
bonfires to sing the deeds of the mighty, both past
and present. They travel the land to w itness great
events firsthand and to ensure that the m em ory of
those events doesn’t pass from the world. With their
songs, they inspire others to reach the sam e heights of
accom plishm ent as the heroes of old.')
INSERT [dbo].[DnD5eSubclass] ([SubclassID], [ClassID], [Name], [ClassLevelChosen], [Description]) VALUES (8, 3, N'Knowledge Domain', 1, N'The gods of knowledge—including Oghma, B occob,
Gilean, Aureon, and Thoth—value learning and
understanding above all. S om e teach that knowledge is
to be gathered and shared in libraries and universities,
or prom ote the practical knowledge o f craft and
invention. S om e deities hoard knowledge and keep its
secrets to themselves. And som e prom ise their followers
that they will gain trem endous pow er if they unlock the
secrets o f the multiverse. Followers of these gods study
esoteric lore, collect old tom es, delve into the secret
places of the earth, and learn all they can. S om e gods
of knowledge prom ote the practical knowledge of craft
and invention, including smith deities like Gond, Reorx,
Onatar, Moradin, Hephaestus, and Goibhniu.')
INSERT [dbo].[DnD5eSubclass] ([SubclassID], [ClassID], [Name], [ClassLevelChosen], [Description]) VALUES (9, 3, N'Life Domain', 1, N'The Life dom ain focuses on the vibrant positive
energy—one o f the fundamental forces of the universe—
that sustains all life. The gods o f life prom ote vitality
and health through healing the sick and wounded,
caring for those in need, and driving away the forces of
death and undeath. Alm ost any non-evil deity can claim
influence over this domain, particularly agricultural
deities (such as Chauntea, Arawai, and Demeter), sun
gods (such as Lathander, Pelor, and Re-Horakhty), gods
B o n u s P r o f i c i e n c y
W hen you choose this dom ain at 1st level, you gain
proficiency with heavy armor.
D i s c i p l e o f L if e
A lso starting at 1st level, your healing spells are more
effective. W henever you use a spell o f 1st level or higher
to restore hit points to a creature, the creature regains
additional hit points equal to 2 + the spell’s level.
C h a n n e l D i v i n i t y : P r e s e r v e L if e
Starting at 2nd level, you can use your Channel Divinity
to heal the badly injured.
As an action, you present your holy sym bol and
evoke healing energy that can restore a number of hit
points equal to five times your cleric level. Choose any
creatures within 30 feet of you, and divide those hit
points am ong them. This feature can restore a creature
to no m ore than half of its hit point maximum. You can’t
use this feature on an undead or a construct.
B l e s s e d H e a l e r
Beginning at 6th level, the healing spells you cast on
others heal you as well. W hen you cast a spell of 1st
level or higher that restores hit points to a creature
other than you, you regain hit points equal to 2 + the
spell’s level.
D i v i n e St r i k e
At 8th level, you gain the ability to infuse your w eapon
strikes with divine energy. O nce on each o f your turns
when you hit a creature with a weapon attack, you can
cause the attack to deal an extra 1d8 radiant damage to
the target. W hen you reach 14th level, the extra damage
increases to 2d8.
S u p r e m e H e a l i n g
Starting at 17th level, when you would norm ally roll
one or m ore dice to restore hit points with a spell, you
instead use the highest number possible for each die.
For example, instead of restoring 2d6 hit points to a
creature, you restore 12.
L i g h t D o m a i n
G ods o f light—including Helm, Lathander, Pholtus,
Branchala, the Silver Flame, Belenus, Apollo, and
Re-Horakhty—prom ote the ideals of rebirth and
renewal, truth, vigilance, and beauty, often using the
symbol of the sun. S om e of these gods are portrayed
as the sun itself or as a charioteer w ho guides the sun
of healing or endurance (such as Ilmater, Mishakal,
Apollo, and Diancecht), and gods of hom e and
com m unity (such as Hestia, Hathor, and Boldrei).')
INSERT [dbo].[DnD5eSubclass] ([SubclassID], [ClassID], [Name], [ClassLevelChosen], [Description]) VALUES (10, 3, N'Light Domain', 1, N'G ods o f light—including Helm, Lathander, Pholtus,
Branchala, the Silver Flame, Belenus, Apollo, and
Re-Horakhty—prom ote the ideals of rebirth and
renewal, truth, vigilance, and beauty, often using the
symbol of the sun. S om e of these gods are portrayed
as the sun itself or as a charioteer w ho guides the sun across the sky. Others are tireless sentinels w hose eyes
pierce every shadow and see through every deception.
Som e are deities of beauty and artistry, who teach that
art is a vehicle for the soul''s improvement. Clerics of a
god o f light are enlightened souls infused with radiance
and the pow er of their gods’ discerning vision, charged
with chasing away lies and burning away darkness')
INSERT [dbo].[DnD5eSubclass] ([SubclassID], [ClassID], [Name], [ClassLevelChosen], [Description]) VALUES (11, 3, N'Nature Domain', 1, N'G ods of nature are as varied as the natural world
itself, from inscrutable gods of the deep forests (such
as Silvanus, Obad-Hai, Chislev, Balinor, and Pan) to
friendly deities associated with particular springs and
groves (such as Eldath). Druids revere nature as a
whole and might serve one of these deities, practicing
mysterious rites and reciting all-but-forgotten prayers in
their own secret tongue. But many of these gods have
clerics as well, cham pions who take a m ore active role
in advancing the interests o f a particular nature god.
These clerics might hunt the evil monstrosities that
despoil the w oodlands, bless the harvest of the faithful,
or wither the crops of those w ho anger their gods.')
INSERT [dbo].[DnD5eSubclass] ([SubclassID], [ClassID], [Name], [ClassLevelChosen], [Description]) VALUES (12, 3, N'Tempest Domain', 1, N'G ods w hose portfolios include the Tempest d o m a in -
including Talos, Umberlee, Kord, Zeboim , the
Devourer, Zeus, and Thor—govern storms, sea, and
sky. They include gods of lightning and thunder, gods
o f earthquakes, som e fire gods, and certain gods of
violence, physical strength, and courage. In som e
pantheons, a god o f this dom ain rules over other deities
and is known for swift justice delivered by thunderbolts.
In the pantheons of seafaring people, gods of this
dom ain are ocean deities and the patrons of sailors.
Tempest gods send their clerics to inspire fear in the
com m on folk, either to keep those folk on the path of
righteousness or to encourage them to offer sacrifices of
propitiation to w ard off divine wrath.')
INSERT [dbo].[DnD5eSubclass] ([SubclassID], [ClassID], [Name], [ClassLevelChosen], [Description]) VALUES (14, 3, N'Trickery Domain', 1, N'G ods of trickery—such as Tymora, Beshaba,
Olidammara, the Traveler, Garl Glittergold, and
Loki—are mischief-m akers and instigators who stand
as a constant challenge to the accepted order am ong
both gods and mortals. They’re patrons of thieves,
scoundrels, gamblers, rebels, and liberators. Their
clerics are a disruptive force in the world, puncturing
pride, m ocking tyrants, stealing from the rich, freeing
captives, and flouting hollow traditions. They prefer
subterfuge, pranks, deception, and theft rather than
direct confrontation.')
INSERT [dbo].[DnD5eSubclass] ([SubclassID], [ClassID], [Name], [ClassLevelChosen], [Description]) VALUES (15, 3, N'War Domain', 1, N'War has many manifestations. It can make heroes of
ordinary people. It can be desperate and horrific, with
acts o f cruelty and cow ardice eclipsing instances of
excellence and courage. In either case, the gods of war
watch over w arriors and reward them for their great
deeds. The clerics of such gods excel in battle, inspiring
others to fight the good fight or offering acts o f violence
as prayers. G ods of war include cham pions of honor
and chivalry (such as Torm, H eironeous, and KiriJolith) as well as gods of destruction and pillage (such
as Erythnul, the Fury, Gruumsh, and Ares) and gods of
conquest and domination (such as Bane, Hextor, and
Maglubiyet). Other w ar gods (such as Tempus, Nike,
and Nuada) take a m ore neutral stance, prom oting war
in all its manifestations and supporting w arriors in any
circum stance.')
INSERT [dbo].[DnD5eSubclass] ([SubclassID], [ClassID], [Name], [ClassLevelChosen], [Description]) VALUES (16, 4, N'Circle of the Land', 2, N'The Circle of the Land is made up of mystics and sages
w ho safeguard ancient knowledge and rites through
a vast oral tradition. These druids meet within sacred
circles of trees or standing stones to whisper primal
secrets in Druidic. The circle’s w isest m em bers preside
as the chief priests of com m unities that hold to the Old
Faith and serve as advisors to the rulers of those folk.
As a m em ber of this circle, your m agic is influenced
by the land where you were initiated into the circle’s
mysterious rites.')
INSERT [dbo].[DnD5eSubclass] ([SubclassID], [ClassID], [Name], [ClassLevelChosen], [Description]) VALUES (17, 4, N'Circle of the Moon', 2, N'Druids of the Circle of the M oon are fierce guardians
of the wilds. Their order gathers under the full m oon to
share news and trade warnings. They haunt the deepest
parts of the wilderness, where they might go for w eeks
on end before crossing paths with another humanoid
creature, let alone another druid.
Changeable as the m oon, a druid of this circle might
prowl as a great cat one night, soar over the treetops
as an eagle the next day, and crash through the
undergrowth in bear form to drive off a trespassing
monster. The wild is in the druid''s blood.')
INSERT [dbo].[DnD5eSubclass] ([SubclassID], [ClassID], [Name], [ClassLevelChosen], [Description]) VALUES (18, 5, N'Champion', 3, N'The archetypal Champion focuses on the development
of raw physical pow er honed to deadly perfection.
Those who model themselves on this archetype combine
rigorous training with physical excellence to deal
devastating blows.')
INSERT [dbo].[DnD5eSubclass] ([SubclassID], [ClassID], [Name], [ClassLevelChosen], [Description]) VALUES (20, 5, N'Battle Master', 3, N'T hose w ho emulate the archetypal Battle Master
employ martial techniques passed down through
generations. To a Battle Master, com bat is an academ ic
field, som etim es including subjects beyond battle such
as weaponsm ithing and calligraphy. Not every fighter
absorbs the lessons of history, theory, and artistry
that are reflected in the Battle Master archetype, but
those w ho do are well-rounded fighters of great skill
and knowledge.')
INSERT [dbo].[DnD5eSubclass] ([SubclassID], [ClassID], [Name], [ClassLevelChosen], [Description]) VALUES (21, 5, N'Eldritch Knight', 3, N'The archetypal Eldritch Knight com bines the martial
mastery com m on to all fighters with a careful study of
magic. Eldritch Knights use magical techniques similar
to those practiced by wizards. They focus their study
on two of the eight schools of magic: abjuration and
evocation. Abjuration spells grant an Eldritch Knight
additional protection in battle, and evocation spells deal
damage to many foes at once, extending the fighter’s
reach in combat. These knights learn a comparatively
small number of spells, com m itting them to m em ory
instead of keeping them in a spellbook.')
INSERT [dbo].[DnD5eSubclass] ([SubclassID], [ClassID], [Name], [ClassLevelChosen], [Description]) VALUES (23, 6, N'Way of the Open Hand', 3, N'M onks of the Way of the Open Hand are the ultimate
masters of martial arts combat, whether armed or
unarm ed. They learn techniques to push and trip their
opponents, manipulate ki to heal damage to their
bodies, and practice advanced meditation that can
protect them from harm.')
INSERT [dbo].[DnD5eSubclass] ([SubclassID], [ClassID], [Name], [ClassLevelChosen], [Description]) VALUES (24, 6, N'Way of Shadow', 3, N'M onks of the Way of Shadow follow a tradition that
values stealth and subterfuge. These m onks might
be called ninjas or shadowdancers, and they serve as
spies and assassins. Som etim es the m em bers of a
ninja monastery are family m em bers, form ing a clan
sw orn to secrecy about their arts and m issions. Other
m onasteries are m ore like thieves’ guilds, hiring out
their services to nobles, rich merchants, or anyone else
w ho can pay their fees. Regardless of their methods, the
heads of these m onasteries expect the unquestioning
obedience of their students.')
INSERT [dbo].[DnD5eSubclass] ([SubclassID], [ClassID], [Name], [ClassLevelChosen], [Description]) VALUES (25, 6, N'Way of the Four Elements', 3, N'You follow a monastic tradition that teaches you to
harness the elements. W hen you focus your ki, you can
align yourself with the forces of creation and bend the
four elements to your will, using them as an extension
of your body. Som e m em bers of this tradition dedicate
themselves to a single element, but others weave the
elements together.
Many m onks of this tradition tattoo their bodies with
representations of their ki powers, com m only imagined
as coiling dragons, but also as phoenixes, fish, plants,
mountains, and cresting waves.')
INSERT [dbo].[DnD5eSubclass] ([SubclassID], [ClassID], [Name], [ClassLevelChosen], [Description]) VALUES (26, 7, N'Oath of Devotion', 3, N'The Oath of Devotion binds a paladin to the loftiest
ideals of justice, virtue, and order. Som etim es called
cavaliers, white knights, or holy warriors, these
paladins meet the ideal of the knight in shining armor,
acting with honor in pursuit o f justice and the greater
good. They hold themselves to the highest standards of
conduct, and som e, for better or w orse, hold the rest of
the world to the sam e standards. Many who swear this
oath are devoted to gods of law and good and use their
gods’ tenets as the m easure o f their devotion. They hold
angels—the perfect servants o f good—as their ideals,
and incorporate im ages of angelic w ings into their
helmets or coats of arms.')
INSERT [dbo].[DnD5eSubclass] ([SubclassID], [ClassID], [Name], [ClassLevelChosen], [Description]) VALUES (27, 7, N'Oath of the Anciencts', 3, N'The Oath of the Ancients is as old as the race of elves
and the rituals of the druids. Som etim es called fey
knights, green knights, or horned knights, paladins w ho
swear this oath cast their lot with the side of the light
in the cosm ic struggle against darkness because they
love the beautiful and life-giving things of the world,
not necessarily because they believe in principles of
honor, courage, and justice. They adorn their arm or and
clothing with im ages of grow ing things—leaves, antlers,
or flow ers—to reflect their com m itm ent to preserving
life and light in the world.')
INSERT [dbo].[DnD5eSubclass] ([SubclassID], [ClassID], [Name], [ClassLevelChosen], [Description]) VALUES (28, 7, N'Oath of Vengeance', 3, N'The Oath of Vengeance is a solem n com m itm ent to
punish those who have com m itted a grievous sin. W hen
evil forces slaughter helpless villagers, when an entire
people turns against the w ill of the gods, when a thieves’
guild grow s too violent and powerful, when a dragon
rampages through the countryside—at times like these,
paladins arise and swear an Oath of Vengeance to set
right that which has gone wrong. To these paladins—
som etim es called avengers or dark knights—their own
purity is not as important as delivering justice.')
INSERT [dbo].[DnD5eSubclass] ([SubclassID], [ClassID], [Name], [ClassLevelChosen], [Description]) VALUES (29, 8, N'Hunter', 3, N'Emulating the Hunter archetype m eans accepting your
place as a bulwark between civilization and the terrors
of the wilderness. As you walk the Hunter’s path, you
learn specialized techniques for fighting the threats
you face, from rampaging ogres and hordes of orcs to
towering giants and terrifying dragons.')
INSERT [dbo].[DnD5eSubclass] ([SubclassID], [ClassID], [Name], [ClassLevelChosen], [Description]) VALUES (31, 8, N'Beast Master', 3, N'The Beast Master archetype em bodies a friendship
between the civilized races and the beasts of the world.
United in focus, beast and ranger w ork as one to fight
the m onstrous foes that threaten civilization and the
w ilderness alike. Emulating the Beast Master archetype
m eans com m itting yourself to this ideal, w orking in
partnership with an animal as its com panion and friend.')
INSERT [dbo].[DnD5eSubclass] ([SubclassID], [ClassID], [Name], [ClassLevelChosen], [Description]) VALUES (32, 9, N'Thief', 3, N'You hone your skills in the larcenous arts. Burglars,
bandits, cutpurses, and other crim inals typically follow
this archetype, but so do rogues who prefer to think of
themselves as professional treasure seekers, explorers,
delvers, and investigators. In addition to improving your
agility and stealth, you learn skills useful for delving into
ancient ruins, reading unfamiliar languages, and using
m agic items you normally couldn’t employ')
INSERT [dbo].[DnD5eSubclass] ([SubclassID], [ClassID], [Name], [ClassLevelChosen], [Description]) VALUES (33, 9, N'Assassin', 3, N'You focus your training on the grim art of death. Those
w ho adhere to this archetype are diverse: hired killers,
spies, bounty hunters, and even specially anointed
priests trained to exterminate the enem ies of their deity.
Stealth, poison, and disguise help you eliminate your
foes with deadly efficiency.')
INSERT [dbo].[DnD5eSubclass] ([SubclassID], [ClassID], [Name], [ClassLevelChosen], [Description]) VALUES (34, 9, N'Arcane Trickster', 3, N'S om e rogues enhance their fine-honed skills of stealth
and agility with magic, learning tricks of enchantment
and illusion. These rogues include pickpockets and
burglars, but also pranksters, mischief-m akers, and a
significant number of adventurers.')
INSERT [dbo].[DnD5eSubclass] ([SubclassID], [ClassID], [Name], [ClassLevelChosen], [Description]) VALUES (35, 10, N'Draconic Bloodline', 1, N'Your innate m agic com es from draconic m agic that was
mingled with your blood or that o f your ancestors. M ost
often, sorcerers with this origin trace their descent
back to a mighty sorcerer of ancient times w ho made a
bargain with a dragon or who might even have claim ed
a dragon parent. S om e of these bloodlines are well
established in the world, but m ost are obscure. Any
given sorcerer could be the first of a new bloodline, as a
result of a pact or som e other exceptional circum stance.')
INSERT [dbo].[DnD5eSubclass] ([SubclassID], [ClassID], [Name], [ClassLevelChosen], [Description]) VALUES (36, 10, N'Wild Magic', 1, N'Your innate m agic com es from the wild forces of chaos
that underlie the order of creation. You might have
endured exposure to som e form o f raw magic, perhaps
through a planar portal leading to Limbo, the Elemental
Planes, or the mysterious Far Realm. Perhaps you
were blessed by a pow erful fey creature or marked by a
demon. Or your magic could be a fluke of your birth, with
no apparent cause or reason. However it cam e to be, this
chaotic m agic churns within you, waiting for any outlet.')
INSERT [dbo].[DnD5eSubclass] ([SubclassID], [ClassID], [Name], [ClassLevelChosen], [Description]) VALUES (37, 11, N'The Archfey', 1, N'Your patron is a lord or lady of the fey, a creature of
legend w ho holds secrets that w ere forgotten before
the mortal races w ere born. This being’s motivations
are often inscrutable, and som etim es whimsical, and
might involve a striving for greater magical pow er or the
settling of age-old grudges. Beings of this sort include
the Prince of Frost; the Queen of Air and Darkness,
ruler of the Gloam ing Court; Titania of the Sum m er
Court; her consort Oberon, the Green Lord; Hyrsam,
the Prince of Fools; and ancient hags.')
INSERT [dbo].[DnD5eSubclass] ([SubclassID], [ClassID], [Name], [ClassLevelChosen], [Description]) VALUES (39, 11, N'The Fiend', 1, N'You have made a pact with a fiend from the lower
planes o f existence, a being w hose aims are evil,
even if you strive against those aims. Such beings
desire the corruption or destruction of all things,
ultimately including you. Fiends powerful enough to
forge a pact include dem on lords such as D em ogorgon,
Orcus, Fraz’Urb-luu, and Baphomet; archdevils such
as Asm odeus, Dispater, M ephistopheles, and Belial;
pit fiends and balors that are especially mighty; and
ultroloths and other lords of the yugoloths.')
INSERT [dbo].[DnD5eSubclass] ([SubclassID], [ClassID], [Name], [ClassLevelChosen], [Description]) VALUES (40, 11, N'The Great Old One', 1, N'Your patron is a mysterious entity w hose nature is
utterly foreign to the fabric of reality. It might com e from
the Far Realm, the space beyond reality, or it could be
one of the elder gods known only in legends. Its motives
are incom prehensible to mortals, and its knowledge so
im m ense and ancient that even the greatest libraries
pale in com parison to the vast secrets it holds. The
Great Old One might be unaware of your existence
or entirely indifferent to you, but the secrets you have
learned allow you to draw your m agic from it.
Entities of this type include Ghaunadar, called That
W hich Lurks; Tharizdun, the Chained God; Dendar, the
Night Serpent; Zargon, the Returner; Great Cthulhu;
and other unfathomable beings.')
INSERT [dbo].[DnD5eSubclass] ([SubclassID], [ClassID], [Name], [ClassLevelChosen], [Description]) VALUES (41, 12, N'School of Abjuration', 2, N'The Sch ool of Abjuration em phasizes m agic that blocks,
banishes, or protects. Detractors of this school say
that its tradition is about denial, negation rather than
positive assertion. You understand, however, that ending
harmful effects, protecting the weak, and banishing evil
influences is anything but a philosophical void. It is a
proud and respected vocation.
Called abjurers, m em bers of this school are sought
when baleful spirits require exorcism , when important
locations must be guarded against magical spying, and
when portals to other planes of existence must be closed.')
INSERT [dbo].[DnD5eSubclass] ([SubclassID], [ClassID], [Name], [ClassLevelChosen], [Description]) VALUES (42, 12, N'School of Conjuration', 2, N'As a conjurer, you favor spells that produce objects
and creatures out o f thin air. You can conjure billowing
clouds of killing fog or sum m on creatures from
elsewhere to fight on your behalf. As your mastery
grows, you learn spells of transportation and can
teleport yourself across vast distances, even to other
planes of existence, in an instant.')
INSERT [dbo].[DnD5eSubclass] ([SubclassID], [ClassID], [Name], [ClassLevelChosen], [Description]) VALUES (43, 12, N'School of Divination', 2, N'The counsel of a diviner is sought by royalty and
com m oners alike, for all seek a clearer understanding
of the past, present, and future. As a diviner, you strive
to part the veils of space, time, and consciousness so
that you can see clearly. You work to master spells of
discernment, remote viewing, supernatural knowledge,
and foresight.')
INSERT [dbo].[DnD5eSubclass] ([SubclassID], [ClassID], [Name], [ClassLevelChosen], [Description]) VALUES (44, 12, N'School of Enchantment', 2, N'As a m em ber of the Sch ool of Enchantment, you have
honed your ability to magically entrance and beguile
other people and monsters. S om e enchanters are
peacem akers w ho bewitch the violent to lay dow n their
arms and charm the cruel into show ing mercy. Others
are tyrants w ho magically bind the unwilling into their
service. M ost enchanters fall som ewhere in between.')
INSERT [dbo].[DnD5eSubclass] ([SubclassID], [ClassID], [Name], [ClassLevelChosen], [Description]) VALUES (45, 12, N'School of Evocation', 2, N'You focus your study on m agic that creates powerful
elemental effects such as bitter cold, searing flame,
rolling thunder, crackling lightning, and burning acid.
Som e evokers find employment in military forces,
serving as artillery to blast enemy arm ies from afar.
Others use their spectacular pow er to protect the weak,
while som e seek their ow n gain as bandits, adventurers,
or aspiring tyrants.')
INSERT [dbo].[DnD5eSubclass] ([SubclassID], [ClassID], [Name], [ClassLevelChosen], [Description]) VALUES (46, 12, N'School of Illusion', 2, N'You focus your studies on m agic that dazzles the
senses, befuddles the mind, and tricks even the w isest
folk. Your magic is subtle, but the illusions crafted by
your keen mind make the im possible seem real. Som e
illusionists—including many gnom e w izards—are
benign tricksters w ho use their spells to entertain.
Others are m ore sinister masters of deception, using
their illusions to frighten and fool others for their
personal gain.')
INSERT [dbo].[DnD5eSubclass] ([SubclassID], [ClassID], [Name], [ClassLevelChosen], [Description]) VALUES (47, 12, N'School of Necromancy', 2, N'The School of N ecrom ancy explores the cosm ic forces
of life, death, and undeath. As you focus your studies in
this tradition, you learn to manipulate the energy that
animates all living things. As you progress, you learn to
sap the life force from a creature as your m agic destroys
its body, transforming that vital energy into magical
pow er you can manipulate.
Most people see necrom ancers as m enacing, or even
villainous, due to the close association with death.
Not all necrom ancers are evil, but the forces they
manipulate are considered taboo by many societies.')
INSERT [dbo].[DnD5eSubclass] ([SubclassID], [ClassID], [Name], [ClassLevelChosen], [Description]) VALUES (48, 12, N'School of Transmutation', 2, N'You are a student of spells that modify energy and matter.
To you, the world is not a fixed thing, but eminently
mutable, and you delight in being an agent of change.
You wield the raw stuff of creation and learn to alter both
physical forms and mental qualities. Your m agic gives
you the tools to becom e a smith on reality’s forge.
Som e transmuters are tinkerers and pranksters,
turning people into toads and transforming copper into
silver for fun and occasional profit. Others pursue their
magical studies with deadly seriousness, seeking the
pow er o f the gods to m ake and destroy worlds.')
SET IDENTITY_INSERT [dbo].[DnD5eSubclass] OFF
SET IDENTITY_INSERT [dbo].[DnD5eSubrace] ON 

INSERT [dbo].[DnD5eSubrace] ([SubraceID], [RaceID], [SubraceName], [SubraceDescription], [StrengthIncrease], [DexterityIncrease], [ConstitutionIncrease], [IntelligenceIncrease], [WisdomIncrease], [CharismaIncrease], [SubraceAbilities]) VALUES (1, 1, N'Hill Dwarf', N'As a hill dwarf, you have keen senses, deep intuition,
and remarkable resilience. The gold dwarves of Faerun
in their mighty southern kingdom are hill dwarves, as
are the exiled Neidar and the debased Klar of Krynn in
the Dragonlance setting.', 0, 0, 0, 0, 1, 0, N'Dwarven Toughness. Your hit point maximum
increases by 1, and it increases by 1 every time you
gain a level.')
INSERT [dbo].[DnD5eSubrace] ([SubraceID], [RaceID], [SubraceName], [SubraceDescription], [StrengthIncrease], [DexterityIncrease], [ConstitutionIncrease], [IntelligenceIncrease], [WisdomIncrease], [CharismaIncrease], [SubraceAbilities]) VALUES (2, 1, N'Mountain Dwarf', N'A s a mountain dwarf, you''re strong and hardy,
accustom ed to a difficult life in rugged terrain. You’re
probably on the tall side (for a dwarf), and tend toward
lighter coloration. The shield dwarves of northern
Faerun, as well as the ruling Hylar clan and the noble
Daewar clan of Dragonlance, are mountain dwarves.', 2, 0, 0, 0, 0, 0, N'Dwarven Armor Training. You have proficiency with
light and medium armor.')
INSERT [dbo].[DnD5eSubrace] ([SubraceID], [RaceID], [SubraceName], [SubraceDescription], [StrengthIncrease], [DexterityIncrease], [ConstitutionIncrease], [IntelligenceIncrease], [WisdomIncrease], [CharismaIncrease], [SubraceAbilities]) VALUES (3, 2, N'High Elf', N'As a high elf, you have a keen mind and a mastery of
at least the basics of magic. In many of the worlds
of D&D, there are two kinds of high elves. One type
(which includes the gray elves and valley elves of
Greyhawk, the Silvanesti of Dragonlance, and the
sun elves of the Forgotten Realms) is haughty and
reclusive, believing themselves to be superior to
non-elves and even other elves. The other type
(including the high elves of Greyhawk. the
Qualinesti of Dragonlance, and the m oon elves
of the Forgotten Realms) are m ore com m on
and m ore friendly, and often encountered
am ong humans and other races.
The sun elves of Faerun (also called gold
elves or sunrise elves) have bronze skin and
hair of copper, black, or golden blond. Their
eyes are golden, silver, or black. M oon elves (also
called silver elves or gray elves) are much paler,
with alabaster skin som etim es tinged with blue.
They often have hair of silver-white, black, or blue,
but various shades of blond, brown, and red are
not uncom m on. Their eyes are blue or green and
flecked with gold.', 0, 0, 0, 1, 0, 0, N'Elf Weapon Training. You have proficiency with
the longsword, shortsword, shortbow, and longbow.
Cantrip. You know one cantrip of your choice from
the wizard spell list. Intelligence is your spellcasting
ability for it.
Extra Language. You can speak, read, and write one
extra language of your choice.')
INSERT [dbo].[DnD5eSubrace] ([SubraceID], [RaceID], [SubraceName], [SubraceDescription], [StrengthIncrease], [DexterityIncrease], [ConstitutionIncrease], [IntelligenceIncrease], [WisdomIncrease], [CharismaIncrease], [SubraceAbilities]) VALUES (4, 2, N'Wood Elf', N'A s a w ood elf, you have keen senses and intuition, and
your fleet feet carry you quickly and stealthily through
your native forests. This category includes the wild
elves (grugach) of Greyhawk and the Kagonesti of
Dragonlance, as well as the races called w ood elves in
Greyhawk and the Forgotten Realms. In Faerun, w ood
elves (also called wild elves, green elves, or forest elves)
are reclusive and distrusting o f non-elves.
W ood elves’ skin tends to be copperish in hue,
som etim es with traces of green. Their hair tends toward
brow ns and blacks, but it is occasionally blond or
copper-colored. Their eyes are green, brown, or hazel.', 0, 0, 0, 0, 1, 0, N'Elf Weapon Training. You have proficiency with the
longsword, shortsword, shortbow, and longbow.
Fleet o f Foot. Your base walking speed
increases to 35 feet.
Mask o f the Wild. You can attempt to hide even when
you are only lightly obscured by foliage, heavy rain,
falling snow, mist, and other natural phenomena.')
INSERT [dbo].[DnD5eSubrace] ([SubraceID], [RaceID], [SubraceName], [SubraceDescription], [StrengthIncrease], [DexterityIncrease], [ConstitutionIncrease], [IntelligenceIncrease], [WisdomIncrease], [CharismaIncrease], [SubraceAbilities]) VALUES (5, 2, N'Drow', N'D escended from an earlier subrace of dark-skinned
elves, the drow were banished from the surface world
for following the goddess Lolth down the path to
evil and corruption. N ow they have built their own
civilization in the depths of the Underdark, patterned
after the Way of Lolth. Also called dark elves, the drow
have black skin that resem bles polished obsidian and
stark white or pale yellow hair. They com m only have
very pale eyes (so pale as to be mistaken for white) in
shades of lilac, silver, pink, red, and blue. They tend to
be smaller and thinner than m ost elves.
Drow adventurers are rare, and the race does not exist
in all worlds. Check with your Dungeon Master to see
if you can play a drow character.', 0, 0, 0, 0, 0, 1, N'Superior Darkvision. Your darkvision has a
radius of 120 feet.
Sunlight Sensitivity. You have disadvantage on attack
rolls and on W isdom (Perception) checks that rely on
sight when you, the target of your attack, or whatever
you are trying to perceive is in direct sunlight.
Drow Magic. You know the dancing lights cantrip.
W hen you reach 3rd level, you can cast the faerie fire
spell once per day. W hen you reach 5th level, you can
also cast the darkness spell once per day. Charisma is
your spellcasting ability for these spells.
Drow Weapon Training. You have proficiency with
rapiers, shortswords, and hand crossbow s.')
INSERT [dbo].[DnD5eSubrace] ([SubraceID], [RaceID], [SubraceName], [SubraceDescription], [StrengthIncrease], [DexterityIncrease], [ConstitutionIncrease], [IntelligenceIncrease], [WisdomIncrease], [CharismaIncrease], [SubraceAbilities]) VALUES (6, 3, N'Lightfoot Halfling', N'As a lightfoot halfling, you can easily hide from notice,
even using other people as cover. You’re inclined to be
affable and get along well with others. In the Forgotten
Realms, lightfoot halflings have spread the farthest and
thus are the most com m on variety.
Lightfoots are m ore prone to wanderlust than other
halflings, and often dwell alongside other races or take
up a nom adic life. In the world of Greyhawk, these
halflings are called hairfeet or tallfellows.', 0, 0, 0, 0, 0, 1, N'Naturally Stealthy. You can attempt to hide even
when you are obscured only by a creature that is at least
one size larger than you')
INSERT [dbo].[DnD5eSubrace] ([SubraceID], [RaceID], [SubraceName], [SubraceDescription], [StrengthIncrease], [DexterityIncrease], [ConstitutionIncrease], [IntelligenceIncrease], [WisdomIncrease], [CharismaIncrease], [SubraceAbilities]) VALUES (7, 3, N'Stout Halfling', N'A s a stout halfling, you’re hardier than average and have
som e resistance to poison. S om e say that stouts have
dwarven blood. In the Forgotten Realms, these halflings
are called stronghearts, and they’re m ost com m on
in the south.', 0, 0, 1, 0, 0, 0, N'You have advantage on saving
throws against poison, and you have resistance
against poison damage.')
INSERT [dbo].[DnD5eSubrace] ([SubraceID], [RaceID], [SubraceName], [SubraceDescription], [StrengthIncrease], [DexterityIncrease], [ConstitutionIncrease], [IntelligenceIncrease], [WisdomIncrease], [CharismaIncrease], [SubraceAbilities]) VALUES (8, 4, N'Variant Human', N'If your campaign uses the optional feat rules from chapter 5,
your Dungeon Master might allow these variant traits, all of
which replace the human’s Ability Score Increase trait.', 0, 0, 0, 0, 0, 0, NULL)
INSERT [dbo].[DnD5eSubrace] ([SubraceID], [RaceID], [SubraceName], [SubraceDescription], [StrengthIncrease], [DexterityIncrease], [ConstitutionIncrease], [IntelligenceIncrease], [WisdomIncrease], [CharismaIncrease], [SubraceAbilities]) VALUES (9, 6, N'Forest Gnome', N'As a forest gnom e, you have a natural knack for illusion
and inherent quickness and stealth. In the worlds of
D&D, forest gnom es are rare and secretive. They gather
in hidden com m unities in sylvan forests, using illusions
and trickery to conceal themselves from threats or
to m ask their escape should they be detected. Forest
gnom es tend to be friendly with other good-spirited
w oodland folk, and they regard elves and good fey as
their most important allies. These gnom es also befriend
small forest animals and rely on them for information
about threats that might prowl their lands.', 0, 1, 0, 0, 0, 0, N'Natural Illusionist. You know the minor illusion
cantrip. Intelligence is your spellcasting ability for it.
Speak with Small Beasts. Through sounds and
gestures, you can com m unicate simple ideas with Small
or sm aller beasts. Forest gnom es love animals and often
keep squirrels, badgers, rabbits, m oles, w oodpeckers,
and other creatures as beloved pets.')
INSERT [dbo].[DnD5eSubrace] ([SubraceID], [RaceID], [SubraceName], [SubraceDescription], [StrengthIncrease], [DexterityIncrease], [ConstitutionIncrease], [IntelligenceIncrease], [WisdomIncrease], [CharismaIncrease], [SubraceAbilities]) VALUES (10, 6, N'Rock Gnome', N'As a rock gnom e, you have a natural inventiveness and
hardiness beyond that of other gnom es. M ost gnom es
in the worlds of D&D are rock gnom es, including the
tinker gnom es of the Dragonlance setting.', 0, 0, 1, 0, 0, 0, N'Artificer’s Lore. W henever you make an Intelligence
(History) check related to m agic items, alchemical
objects, or technological devices, you can add tw ice your
proficiency bonus, instead of any proficiency bonus you
normally apply.
Tinker. You have proficiency with artisan’s tools
(tinker’s tools). Using those tools, you can spend 1
hour and 10 gp worth of materials to construct a Tiny
clockw ork device (AC 5, 1 hp). The device ceases
to function after 24 hours (unless you spend 1 hour
repairing it to keep the device functioning), or when
you use your action to dismantle it; at that time, you can
reclaim the materials used to create it. You can have up
to three such devices active at a time.
W hen you create a device, choose one of the
following options:
Clockwork Toy. This toy is a clockw ork animal, monster,
or person, such as a frog, mouse, bird, dragon, or
soldier. W hen placed on the ground, the toy m oves
5 feet across the ground on each of your turns in a
random direction. It makes noises as appropriate
to the creature it represents.
Fire Starter. The device produces a miniature
flame, which you can use to light a candle,
torch, or campfire. Using the device
requires your action.
Music Box. W hen opened, this music box
plays a single song at a moderate volume.
The box stops playing when it
reaches the son g’s end or
when it is closed.')
SET IDENTITY_INSERT [dbo].[DnD5eSubrace] OFF
SET IDENTITY_INSERT [dbo].[DnD5eWeaponProperties] ON 

INSERT [dbo].[DnD5eWeaponProperties] ([WeaponPropertyID], [PropertyName], [PropertyDescription]) VALUES (1, N'Finesse', N'W hen making an attack with a finesse
weapon, you use your choice o f your Strength or
Dexterity modifier for the attack and damage rolls. You
must use the sam e m odifier for both rolls.')
INSERT [dbo].[DnD5eWeaponProperties] ([WeaponPropertyID], [PropertyName], [PropertyDescription]) VALUES (2, N'Heavy', N'Sm all creatures have disadvantage on attack
rolls with heavy w eapons. A heavy w eapon’s size and
bulk make it too large for a Sm all creature to use
effectively.
Light. A li')
INSERT [dbo].[DnD5eWeaponProperties] ([WeaponPropertyID], [PropertyName], [PropertyDescription]) VALUES (3, N'Light', N'A light w eapon is small and easy to handle,
making it ideal for use when fighting with two weapons.
See the rules for two-weapon fighting in chapter 9')
INSERT [dbo].[DnD5eWeaponProperties] ([WeaponPropertyID], [PropertyName], [PropertyDescription]) VALUES (4, N'Loading', N'Because of the time required to load this
weapon, you can fire only one piece of ammunition
from it when you use an action, bonus action, or reaction
to fire it, regardless of the number of attacks you can
normally make.')
INSERT [dbo].[DnD5eWeaponProperties] ([WeaponPropertyID], [PropertyName], [PropertyDescription]) VALUES (5, N'Range', N' A w eapon that can be used to make a ranged
attack has a range show n in parentheses after the
ammunition or thrown property. The range lists two
numbers. The first is the w eapon’s norm al range in feet,
and the second indicates the w eapon’s maximum range.
W hen attacking a target beyond norm al range, you have
disadvantage on the attack roll. You can’t attack a target
beyond the w eapon’s long range')
INSERT [dbo].[DnD5eWeaponProperties] ([WeaponPropertyID], [PropertyName], [PropertyDescription]) VALUES (6, N'Reach', N'This w eapon adds 5 feet to your reach when
you attack with it.')
INSERT [dbo].[DnD5eWeaponProperties] ([WeaponPropertyID], [PropertyName], [PropertyDescription]) VALUES (7, N'Special', N'A w eapon with the special property has
unusual rules governing its use, explained in the
w eapon’s description (see "Special W eapons" later in
this section).')
INSERT [dbo].[DnD5eWeaponProperties] ([WeaponPropertyID], [PropertyName], [PropertyDescription]) VALUES (8, N'Thrown', N'. If a weapon has the thrown property, you
can throw the w eapon to make a ranged attack. If the
weapon is a melee weapon, you use the sam e ability
m odifier for that attack roll and damage roll that you
would use for a melee attack with the weapon. For
example, if you throw a handaxe, you use your Strength,
but if you throw a dagger, you can use either your
Strength or your Dexterity, since the dagger has the
finesse property.')
INSERT [dbo].[DnD5eWeaponProperties] ([WeaponPropertyID], [PropertyName], [PropertyDescription]) VALUES (9, N'Two-Handed', N'This w eapon requires two hands to use')
INSERT [dbo].[DnD5eWeaponProperties] ([WeaponPropertyID], [PropertyName], [PropertyDescription]) VALUES (10, N'Versatile', N'. This weapon can be used with one or two
hands. A damage value in parentheses appears with the
property—the damage when the w eapon is used with
two hands to make a melee attack.')
INSERT [dbo].[DnD5eWeaponProperties] ([WeaponPropertyID], [PropertyName], [PropertyDescription]) VALUES (11, N'Improvised', N'An object that bears no resem blance to a weapon
deals 1d4 damage (the DM assigns a damage type
appropriate to the object). If a character uses a ranged
weapon to make a m elee attack, or throws a melee
weapon that does not have the thrown property, it also
deals 1d4 damage. An im provised thrown w eapon has a
normal range of 20 feet and a long range of 60 feet.')
INSERT [dbo].[DnD5eWeaponProperties] ([WeaponPropertyID], [PropertyName], [PropertyDescription]) VALUES (12, N'Silver', N'Som e m onsters that have immunity or resistance
to nonm agical w eapons are susceptible to silver
weapons, so cautious adventurers invest extra coin to
plate their w eapons with silver. You can silver a single
weapon or ten pieces of ammunition for 100 gp. This
cost represents not only the price of the silver, but the
time and expertise needed to add silver to the weapon
without making it less effective.')
INSERT [dbo].[DnD5eWeaponProperties] ([WeaponPropertyID], [PropertyName], [PropertyDescription]) VALUES (13, N'Lance', N'You have disadvantage when you use a lance
to attack a target within 5 feet of you. Also, a lance
requires two hands to wield when you aren’t mounted.')
INSERT [dbo].[DnD5eWeaponProperties] ([WeaponPropertyID], [PropertyName], [PropertyDescription]) VALUES (15, N'Net', N'A Large or sm aller creature hit by a net is
restrained until it is freed. A net has no effect on
creatures that are form less, or creatures that are Huge
or larger. A creature can use its action to make a DC 10
Strength check, freeing itself or another creature within
its reach on a success. Dealing 5 slashing damage to the
net (AC 10) also frees the creature without harming it,
ending the effect and destroying the net.
W hen you use an action, bonus action, or reaction
to attack with a net, you can make only one attack
regardless of the number of attacks you can
normally make.')
SET IDENTITY_INSERT [dbo].[DnD5eWeaponProperties] OFF
SET IDENTITY_INSERT [dbo].[DnD5eWeapons] ON 

INSERT [dbo].[DnD5eWeapons] ([WeaponID], [Name], [Description], [DamageType], [DamageDice], [AttackBonusStat], [DamageModifier], [IsMagical], [WeaponType], [Properties], [Weight], [Melee], [Cost], [Abilities]) VALUES (6, N'Club', N'Simple Club', N'bludgeoning', N'1d4', N'Strength', 0, 0, N'Simple', N'Light', 2, 1, 10, NULL)
INSERT [dbo].[DnD5eWeapons] ([WeaponID], [Name], [Description], [DamageType], [DamageDice], [AttackBonusStat], [DamageModifier], [IsMagical], [WeaponType], [Properties], [Weight], [Melee], [Cost], [Abilities]) VALUES (7, N'Spear', N'Spear', N'piercing', N'1d6', N'Strength', 0, 0, N'Simple', N'Thrown (range 20/60), versatile (1d8)', 3, 1, 100, NULL)
INSERT [dbo].[DnD5eWeapons] ([WeaponID], [Name], [Description], [DamageType], [DamageDice], [AttackBonusStat], [DamageModifier], [IsMagical], [WeaponType], [Properties], [Weight], [Melee], [Cost], [Abilities]) VALUES (8, N'Quarterstaff', N'Staff', N'bludgeoning', N'1d6', N'Strength', 0, 0, N'Simple', N'Versatile (1d8)', 4, 1, 20, NULL)
INSERT [dbo].[DnD5eWeapons] ([WeaponID], [Name], [Description], [DamageType], [DamageDice], [AttackBonusStat], [DamageModifier], [IsMagical], [WeaponType], [Properties], [Weight], [Melee], [Cost], [Abilities]) VALUES (9, N'Handaxe', N'Axe', N'slashing', N'1d6', N'Strength', 0, 0, N'Simple', N'Light, thrown (range 20/60)', 2, 1, 500, NULL)
INSERT [dbo].[DnD5eWeapons] ([WeaponID], [Name], [Description], [DamageType], [DamageDice], [AttackBonusStat], [DamageModifier], [IsMagical], [WeaponType], [Properties], [Weight], [Melee], [Cost], [Abilities]) VALUES (10, N'Dart', N'Fling', N'piercing', N'1d4', N'Dexterity', 0, 0, N'Simple', N'Finesse, thrown (range 20/60)', 0, 0, 5, NULL)
INSERT [dbo].[DnD5eWeapons] ([WeaponID], [Name], [Description], [DamageType], [DamageDice], [AttackBonusStat], [DamageModifier], [IsMagical], [WeaponType], [Properties], [Weight], [Melee], [Cost], [Abilities]) VALUES (11, N'Battleaxe', N'Axe', N'slashing', N'1d8', N'Strength', 0, 0, N'Martial', N'Versatile (1d8)', 4, 1, 1000, NULL)
INSERT [dbo].[DnD5eWeapons] ([WeaponID], [Name], [Description], [DamageType], [DamageDice], [AttackBonusStat], [DamageModifier], [IsMagical], [WeaponType], [Properties], [Weight], [Melee], [Cost], [Abilities]) VALUES (12, N'Pike', N'Pointy', N'piercing', N'1d10', N'Strength', 0, 0, N'Martial', N'Heavy, reach, two-handed', 18, 1, 500, NULL)
INSERT [dbo].[DnD5eWeapons] ([WeaponID], [Name], [Description], [DamageType], [DamageDice], [AttackBonusStat], [DamageModifier], [IsMagical], [WeaponType], [Properties], [Weight], [Melee], [Cost], [Abilities]) VALUES (13, N'Crossbow, heavy', N'longer ranged dart', N'piercing', N'1d10', N'Dexterity', 0, 0, N'Martial', N'Ammunition (range 100/400), heavy, loading, two-handed', 18, 0, 7500, NULL)
INSERT [dbo].[DnD5eWeapons] ([WeaponID], [Name], [Description], [DamageType], [DamageDice], [AttackBonusStat], [DamageModifier], [IsMagical], [WeaponType], [Properties], [Weight], [Melee], [Cost], [Abilities]) VALUES (15, N'Dagger', N'Stabby stab', N'piercing', N'1d4', N'Strength', 0, 0, N'Simple', N'Finesse,light,thrown (range 20/60)', 1, 1, 200, NULL)
INSERT [dbo].[DnD5eWeapons] ([WeaponID], [Name], [Description], [DamageType], [DamageDice], [AttackBonusStat], [DamageModifier], [IsMagical], [WeaponType], [Properties], [Weight], [Melee], [Cost], [Abilities]) VALUES (17, N'Crossbow, light', N'A light point shoot', N'piercing', N'1d8', N'Dexterity', 0, 0, N'Simple', N'Ammunition (range 80/320), loading, two-handed', 5, 0, 2500, NULL)
INSERT [dbo].[DnD5eWeapons] ([WeaponID], [Name], [Description], [DamageType], [DamageDice], [AttackBonusStat], [DamageModifier], [IsMagical], [WeaponType], [Properties], [Weight], [Melee], [Cost], [Abilities]) VALUES (18, N'Shortbow', N'Small Bow', N'piercing', N'1d6', N'Dexterity', 0, 0, N'Simple', N'Ammunition (range 80/320), two-handed', 2, 0, 2500, NULL)
SET IDENTITY_INSERT [dbo].[DnD5eWeapons] OFF
INSERT [dbo].[DnD5eWeaponstoProperties] ([WeaponID], [WeaponPropertyID]) VALUES (6, 3)
INSERT [dbo].[DnD5eWeaponstoProperties] ([WeaponID], [WeaponPropertyID]) VALUES (7, 8)
INSERT [dbo].[DnD5eWeaponstoProperties] ([WeaponID], [WeaponPropertyID]) VALUES (7, 10)
SET IDENTITY_INSERT [dbo].[GameType] ON 

INSERT [dbo].[GameType] ([GameID], [Name], [Genre], [DiceSystem], [Description]) VALUES (1, N'DnD', N'Fantasy', N'd20', N'The most famous TTRPG around.')
INSERT [dbo].[GameType] ([GameID], [Name], [Genre], [DiceSystem], [Description]) VALUES (2, N'Numenera', N'Science Fantasy', N'd20', N'An exploration based adventure set 1 billion years in the future of Earth ')
SET IDENTITY_INSERT [dbo].[GameType] OFF
SET IDENTITY_INSERT [dbo].[Player] ON 

INSERT [dbo].[Player] ([PlayerID], [UserID], [Biography], [GamePreferences], [SeekingGroupFor]) VALUES (1, 2, N'aSdadasd', NULL, NULL)
INSERT [dbo].[Player] ([PlayerID], [UserID], [Biography], [GamePreferences], [SeekingGroupFor]) VALUES (2, 3, N'asdadasdvvea', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Player] OFF
INSERT [dbo].[PlayerInGroup] ([PlayerID], [GroupID], [IsGM], [JoinDate]) VALUES (2, 1, 1, NULL)
INSERT [dbo].[PlayerInGroup] ([PlayerID], [GroupID], [IsGM], [JoinDate]) VALUES (1, 3, 1, NULL)
INSERT [dbo].[PlayerInGroup] ([PlayerID], [GroupID], [IsGM], [JoinDate]) VALUES (1, 1, 0, NULL)
INSERT [dbo].[PlayerInGroup] ([PlayerID], [GroupID], [IsGM], [JoinDate]) VALUES (2, 3, 0, NULL)
SET IDENTITY_INSERT [dbo].[RPGGroup] ON 

INSERT [dbo].[RPGGroup] ([GroupID], [GameMasterID], [GameTypeID], [GroupTitle], [MaxPlayers], [CurrentPlayerCount], [NextSessionScheduledStart], [NextSessionScheduledEndTime], [NumberOfSessions], [CreationDate]) VALUES (1, 2, 1, N'Best Friends Hate D&D', 4, 2, CAST(N'2019-03-05T01:30:00.000' AS DateTime), CAST(N'2019-03-05T05:30:00.000' AS DateTime), 2, CAST(N'2018-12-31T00:00:00.000' AS DateTime))
INSERT [dbo].[RPGGroup] ([GroupID], [GameMasterID], [GameTypeID], [GroupTitle], [MaxPlayers], [CurrentPlayerCount], [NextSessionScheduledStart], [NextSessionScheduledEndTime], [NumberOfSessions], [CreationDate]) VALUES (3, 1, 1, N'Infrequent D&D', 6, 2, CAST(N'2019-03-05T06:30:00.000' AS DateTime), CAST(N'2019-03-05T08:45:00.000' AS DateTime), 5, CAST(N'2019-02-02T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[RPGGroup] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [EmailAddress], [UserName], [PhoneNumber], [Gender], [Address], [Age], [DOB], [Password], [Salt], [Role], [ProfilePicturePath], [CreationDate]) VALUES (2, N'fake.now@emailaddress.com', N'The Old Man', N'555-5455', N'M', N'5450 RockyRoad', 28, CAST(N'1990-10-10T00:00:00.000' AS DateTime), N'asdasdasdswad', NULL, NULL, N'Default.png', CAST(N'2018-11-11T00:00:00.000' AS DateTime))
INSERT [dbo].[Users] ([UserID], [EmailAddress], [UserName], [PhoneNumber], [Gender], [Address], [Age], [DOB], [Password], [Salt], [Role], [ProfilePicturePath], [CreationDate]) VALUES (3, N'another.fake@email.com', N'DaFuzzBoy', N'555-5555', N'F', N'50 Springfield Drive', 18, CAST(N'2000-05-05T00:00:00.000' AS DateTime), N'sfksdjf', NULL, NULL, N'Default.png', CAST(N'2019-03-03T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Users] OFF
ALTER TABLE [dbo].[DnD5eCharacter] ADD  CONSTRAINT [DF_DnD5eCharacter_StrengthScore]  DEFAULT ((0)) FOR [StrengthScore]
GO
ALTER TABLE [dbo].[DnD5eCharacter] ADD  CONSTRAINT [DF_DnD5eCharacter_DexterityScore]  DEFAULT ((0)) FOR [DexterityScore]
GO
ALTER TABLE [dbo].[DnD5eCharacter] ADD  CONSTRAINT [DF_DnD5eCharacter_ConstitutionScore]  DEFAULT ((0)) FOR [ConstitutionScore]
GO
ALTER TABLE [dbo].[DnD5eCharacter] ADD  CONSTRAINT [DF_DnD5eCharacter_CharismaScore]  DEFAULT ((0)) FOR [CharismaScore]
GO
ALTER TABLE [dbo].[DnD5eCharacter] ADD  CONSTRAINT [DF_DnD5eCharacter_IntelligenceScore]  DEFAULT ((0)) FOR [IntelligenceScore]
GO
ALTER TABLE [dbo].[DnD5eCharacter] ADD  CONSTRAINT [DF_DnD5eCharacter_WisdomScore]  DEFAULT ((0)) FOR [WisdomScore]
GO
ALTER TABLE [dbo].[DnD5eCharacter] ADD  CONSTRAINT [DF_DnD5eCharacter_ProfociencyBonus]  DEFAULT ((2)) FOR [ProfociencyBonus]
GO
ALTER TABLE [dbo].[DnD5eCharacter] ADD  CONSTRAINT [DF_DnD5eCharacter_TotalLevel]  DEFAULT ((1)) FOR [TotalLevel]
GO
ALTER TABLE [dbo].[DnD5eCharacter] ADD  CONSTRAINT [DF_DnD5eCharacter_CurrentXP]  DEFAULT ((0)) FOR [CurrentXP]
GO
ALTER TABLE [dbo].[DnD5eCharacter] ADD  CONSTRAINT [DF_DnD5eCharacter_XPNeededToLevelUp]  DEFAULT ((1000)) FOR [XPNeededToLevelUp]
GO
ALTER TABLE [dbo].[DnD5eCharacter] ADD  CONSTRAINT [DF_DnD5eCharacter_StrengthMod]  DEFAULT ((0)) FOR [StrengthMod]
GO
ALTER TABLE [dbo].[DnD5eCharacter] ADD  CONSTRAINT [DF_DnD5eCharacter_DexterityMod]  DEFAULT ((0)) FOR [DexterityMod]
GO
ALTER TABLE [dbo].[DnD5eCharacter] ADD  CONSTRAINT [DF_DnD5eCharacter_ConstitutionMod]  DEFAULT ((0)) FOR [ConstitutionMod]
GO
ALTER TABLE [dbo].[DnD5eCharacter] ADD  CONSTRAINT [DF_DnD5eCharacter_CharismaMod]  DEFAULT ((0)) FOR [CharismaMod]
GO
ALTER TABLE [dbo].[DnD5eCharacter] ADD  CONSTRAINT [DF_DnD5eCharacter_WisdomMod]  DEFAULT ((0)) FOR [WisdomMod]
GO
ALTER TABLE [dbo].[DnD5eCharacter] ADD  CONSTRAINT [DF_DnD5eCharacter_IntelligenceMod]  DEFAULT ((0)) FOR [IntelligenceMod]
GO
ALTER TABLE [dbo].[DnD5eCharacter] ADD  CONSTRAINT [DF_DnD5eCharacter_CurrentHitPoints]  DEFAULT ((0)) FOR [CurrentHitPoints]
GO
ALTER TABLE [dbo].[DnD5eCharacter] ADD  CONSTRAINT [DF_DnD5eCharacter_GoldAmount]  DEFAULT ((0)) FOR [GoldAmount]
GO
ALTER TABLE [dbo].[DnD5eCharacter] ADD  CONSTRAINT [DF_DnD5eCharacter_ElectrumAmount]  DEFAULT ((0)) FOR [ElectrumAmount]
GO
ALTER TABLE [dbo].[DnD5eCharacter] ADD  CONSTRAINT [DF_DnD5eCharacter_SiverAmount]  DEFAULT ((0)) FOR [SiverAmount]
GO
ALTER TABLE [dbo].[DnD5eCharacter] ADD  CONSTRAINT [DF_DnD5eCharacter_CopperAmount]  DEFAULT ((0)) FOR [CopperAmount]
GO
ALTER TABLE [dbo].[DnD5eCharacter] ADD  CONSTRAINT [DF_DnD5eCharacter_FirstLevelSpellSlots]  DEFAULT ((0)) FOR [FirstLevelSpellSlots]
GO
ALTER TABLE [dbo].[DnD5eCharacter] ADD  CONSTRAINT [DF_DnD5eCharacter_SecondLevelSpellSlots]  DEFAULT ((0)) FOR [SecondLevelSpellSlots]
GO
ALTER TABLE [dbo].[DnD5eCharacter] ADD  CONSTRAINT [DF_DnD5eCharacter_ThirdLevelSpellSlots]  DEFAULT ((0)) FOR [ThirdLevelSpellSlots]
GO
ALTER TABLE [dbo].[DnD5eCharacter] ADD  CONSTRAINT [DF_DnD5eCharacter_FourthLevelSpellSlots]  DEFAULT ((0)) FOR [FourthLevelSpellSlots]
GO
ALTER TABLE [dbo].[DnD5eCharacter] ADD  CONSTRAINT [DF_DnD5eCharacter_FifthLevelSpellSlots]  DEFAULT ((0)) FOR [FifthLevelSpellSlots]
GO
ALTER TABLE [dbo].[DnD5eCharacter] ADD  CONSTRAINT [DF_DnD5eCharacter_SixthLevelSpellSlots]  DEFAULT ((0)) FOR [SixthLevelSpellSlots]
GO
ALTER TABLE [dbo].[DnD5eCharacter] ADD  CONSTRAINT [DF_DnD5eCharacter_SeventhLevelSpellSlots]  DEFAULT ((0)) FOR [SeventhLevelSpellSlots]
GO
ALTER TABLE [dbo].[DnD5eCharacter] ADD  CONSTRAINT [DF_DnD5eCharacter_EighthLevelSpellSlots]  DEFAULT ((0)) FOR [EighthLevelSpellSlots]
GO
ALTER TABLE [dbo].[DnD5eCharacter] ADD  CONSTRAINT [DF_DnD5eCharacter_NinthLevelSpellSlots]  DEFAULT ((0)) FOR [NinthLevelSpellSlots]
GO
ALTER TABLE [dbo].[DnD5eCharacter] ADD  CONSTRAINT [DF_DnD5eCharacter_SpellsKnown]  DEFAULT ((0)) FOR [SpellsKnown]
GO
ALTER TABLE [dbo].[DnD5eCharacter] ADD  CONSTRAINT [DF_DnD5eCharacter_CantripsKnown]  DEFAULT ((0)) FOR [CantripsKnown]
GO
ALTER TABLE [dbo].[DnD5eCharacterToArmor] ADD  CONSTRAINT [DF_DnD5eCharacterToArmor_IsProficient]  DEFAULT ((0)) FOR [IsProficient]
GO
ALTER TABLE [dbo].[DnD5eCharacterToWeapons] ADD  CONSTRAINT [DF_DnD5eCharacterToWeapons_Quantity]  DEFAULT ((1)) FOR [Quantity]
GO
ALTER TABLE [dbo].[DnD5eWeapons] ADD  CONSTRAINT [DF_DnD5eWeapons_DamageModifier]  DEFAULT ((0)) FOR [DamageModifier]
GO
ALTER TABLE [dbo].[DnD5eWeapons] ADD  CONSTRAINT [DF_DnD5eWeapons_IsMagical]  DEFAULT ((0)) FOR [IsMagical]
GO
ALTER TABLE [dbo].[RPGGroup] ADD  CONSTRAINT [DF_RPGGroup_MaxPlayers]  DEFAULT ((1)) FOR [MaxPlayers]
GO
ALTER TABLE [dbo].[RPGGroup] ADD  CONSTRAINT [DF_RPGGroup_CurrentPlayerCount]  DEFAULT ((1)) FOR [CurrentPlayerCount]
GO
ALTER TABLE [dbo].[RPGGroup] ADD  CONSTRAINT [DF_RPGGroup_NumberOfSessions]  DEFAULT ((0)) FOR [NumberOfSessions]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_ProfilePicturePath]  DEFAULT ('Default.png') FOR [ProfilePicturePath]
GO
ALTER TABLE [dbo].[Character]  WITH CHECK ADD  CONSTRAINT [FK_Character_GameType] FOREIGN KEY([GameTypeID])
REFERENCES [dbo].[GameType] ([GameID])
GO
ALTER TABLE [dbo].[Character] CHECK CONSTRAINT [FK_Character_GameType]
GO
ALTER TABLE [dbo].[Character]  WITH CHECK ADD  CONSTRAINT [FK_Character_Player] FOREIGN KEY([PlayerID])
REFERENCES [dbo].[Player] ([PlayerID])
GO
ALTER TABLE [dbo].[Character] CHECK CONSTRAINT [FK_Character_Player]
GO
ALTER TABLE [dbo].[CharacterToRPGGroup]  WITH CHECK ADD  CONSTRAINT [FK_CharacterToRPGGroup_Character] FOREIGN KEY([CharacterID])
REFERENCES [dbo].[Character] ([CharacterID])
GO
ALTER TABLE [dbo].[CharacterToRPGGroup] CHECK CONSTRAINT [FK_CharacterToRPGGroup_Character]
GO
ALTER TABLE [dbo].[CharacterToRPGGroup]  WITH CHECK ADD  CONSTRAINT [FK_CharacterToRPGGroup_RPGGroup] FOREIGN KEY([GroupID])
REFERENCES [dbo].[RPGGroup] ([GroupID])
GO
ALTER TABLE [dbo].[CharacterToRPGGroup] CHECK CONSTRAINT [FK_CharacterToRPGGroup_RPGGroup]
GO
ALTER TABLE [dbo].[DnD5eBackgroundToProfSkills]  WITH CHECK ADD  CONSTRAINT [FK_DnD5eBackgroundToProfSkills_DnD5eBackground] FOREIGN KEY([BackgroundID])
REFERENCES [dbo].[DnD5eBackground] ([BackgroundID])
GO
ALTER TABLE [dbo].[DnD5eBackgroundToProfSkills] CHECK CONSTRAINT [FK_DnD5eBackgroundToProfSkills_DnD5eBackground]
GO
ALTER TABLE [dbo].[DnD5eBackgroundToProfSkills]  WITH CHECK ADD  CONSTRAINT [FK_DnD5eBackgroundToProfSkills_DnD5eSkills] FOREIGN KEY([SkillID])
REFERENCES [dbo].[DnD5eSkills] ([SkillID])
GO
ALTER TABLE [dbo].[DnD5eBackgroundToProfSkills] CHECK CONSTRAINT [FK_DnD5eBackgroundToProfSkills_DnD5eSkills]
GO
ALTER TABLE [dbo].[DnD5eCharacter]  WITH CHECK ADD  CONSTRAINT [FK_DnD5eCharacter_Character] FOREIGN KEY([CharacterID])
REFERENCES [dbo].[Character] ([CharacterID])
GO
ALTER TABLE [dbo].[DnD5eCharacter] CHECK CONSTRAINT [FK_DnD5eCharacter_Character]
GO
ALTER TABLE [dbo].[DnD5eCharacter]  WITH CHECK ADD  CONSTRAINT [FK_DnD5eCharacter_DnD5eBackground] FOREIGN KEY([BackgroundID])
REFERENCES [dbo].[DnD5eBackground] ([BackgroundID])
GO
ALTER TABLE [dbo].[DnD5eCharacter] CHECK CONSTRAINT [FK_DnD5eCharacter_DnD5eBackground]
GO
ALTER TABLE [dbo].[DnD5eCharacter]  WITH CHECK ADD  CONSTRAINT [FK_DnD5eCharacter_DnD5eRaces] FOREIGN KEY([RaceID])
REFERENCES [dbo].[DnD5eRaces] ([RaceID])
GO
ALTER TABLE [dbo].[DnD5eCharacter] CHECK CONSTRAINT [FK_DnD5eCharacter_DnD5eRaces]
GO
ALTER TABLE [dbo].[DnD5eCharacter]  WITH CHECK ADD  CONSTRAINT [FK_DnD5eCharacter_DnD5eSubrace] FOREIGN KEY([SubraceID])
REFERENCES [dbo].[DnD5eSubrace] ([SubraceID])
GO
ALTER TABLE [dbo].[DnD5eCharacter] CHECK CONSTRAINT [FK_DnD5eCharacter_DnD5eSubrace]
GO
ALTER TABLE [dbo].[DnD5eCharacterToArmor]  WITH CHECK ADD  CONSTRAINT [FK_DnD5eCharacterToArmor_DnD5eArmor] FOREIGN KEY([ArmorID])
REFERENCES [dbo].[DnD5eArmor] ([ArmorID])
GO
ALTER TABLE [dbo].[DnD5eCharacterToArmor] CHECK CONSTRAINT [FK_DnD5eCharacterToArmor_DnD5eArmor]
GO
ALTER TABLE [dbo].[DnD5eCharacterToArmor]  WITH CHECK ADD  CONSTRAINT [FK_DnD5eCharacterToArmor_DnD5eCharacter] FOREIGN KEY([CharacterID])
REFERENCES [dbo].[DnD5eCharacter] ([CharacterID])
GO
ALTER TABLE [dbo].[DnD5eCharacterToArmor] CHECK CONSTRAINT [FK_DnD5eCharacterToArmor_DnD5eCharacter]
GO
ALTER TABLE [dbo].[DnD5eCharacterToClass]  WITH CHECK ADD  CONSTRAINT [FK_DnD5eCharacterToClass_DnD5eCharacter] FOREIGN KEY([CharacterID])
REFERENCES [dbo].[DnD5eCharacter] ([CharacterID])
GO
ALTER TABLE [dbo].[DnD5eCharacterToClass] CHECK CONSTRAINT [FK_DnD5eCharacterToClass_DnD5eCharacter]
GO
ALTER TABLE [dbo].[DnD5eCharacterToClass]  WITH CHECK ADD  CONSTRAINT [FK_DnD5eCharacterToClass_DnD5eClass] FOREIGN KEY([ClassID])
REFERENCES [dbo].[DnD5eClass] ([ClassID])
GO
ALTER TABLE [dbo].[DnD5eCharacterToClass] CHECK CONSTRAINT [FK_DnD5eCharacterToClass_DnD5eClass]
GO
ALTER TABLE [dbo].[DnD5eCharacterToFeats]  WITH CHECK ADD  CONSTRAINT [FK_DnD5eCharacterToFeats_DnD5eCharacter] FOREIGN KEY([CharacterID])
REFERENCES [dbo].[DnD5eCharacter] ([CharacterID])
GO
ALTER TABLE [dbo].[DnD5eCharacterToFeats] CHECK CONSTRAINT [FK_DnD5eCharacterToFeats_DnD5eCharacter]
GO
ALTER TABLE [dbo].[DnD5eCharacterToFeats]  WITH CHECK ADD  CONSTRAINT [FK_DnD5eCharacterToFeats_DnD5eFeats] FOREIGN KEY([FeatID])
REFERENCES [dbo].[DnD5eFeats] ([FeatID])
GO
ALTER TABLE [dbo].[DnD5eCharacterToFeats] CHECK CONSTRAINT [FK_DnD5eCharacterToFeats_DnD5eFeats]
GO
ALTER TABLE [dbo].[DnD5eCharacterToItem]  WITH CHECK ADD  CONSTRAINT [FK_DnD5eCharacterToItem_DnD5eCharacter] FOREIGN KEY([CharacterID])
REFERENCES [dbo].[DnD5eCharacter] ([CharacterID])
GO
ALTER TABLE [dbo].[DnD5eCharacterToItem] CHECK CONSTRAINT [FK_DnD5eCharacterToItem_DnD5eCharacter]
GO
ALTER TABLE [dbo].[DnD5eCharacterToItem]  WITH CHECK ADD  CONSTRAINT [FK_DnD5eCharacterToItem_DnD5eItems] FOREIGN KEY([ItemID])
REFERENCES [dbo].[DnD5eItems] ([ItemID])
GO
ALTER TABLE [dbo].[DnD5eCharacterToItem] CHECK CONSTRAINT [FK_DnD5eCharacterToItem_DnD5eItems]
GO
ALTER TABLE [dbo].[DnD5eCharacterToProfSkill]  WITH CHECK ADD  CONSTRAINT [FK_DnD5eCharacterToProfSkill_DnD5eCharacterToProfSkill] FOREIGN KEY([CharacterID])
REFERENCES [dbo].[DnD5eCharacter] ([CharacterID])
GO
ALTER TABLE [dbo].[DnD5eCharacterToProfSkill] CHECK CONSTRAINT [FK_DnD5eCharacterToProfSkill_DnD5eCharacterToProfSkill]
GO
ALTER TABLE [dbo].[DnD5eCharacterToProfSkill]  WITH CHECK ADD  CONSTRAINT [FK_DnD5eCharacterToProfSkill_DnD5eSkills] FOREIGN KEY([SkillID])
REFERENCES [dbo].[DnD5eSkills] ([SkillID])
GO
ALTER TABLE [dbo].[DnD5eCharacterToProfSkill] CHECK CONSTRAINT [FK_DnD5eCharacterToProfSkill_DnD5eSkills]
GO
ALTER TABLE [dbo].[DnD5eCharacterToSpell]  WITH CHECK ADD  CONSTRAINT [FK_DnD5eCharacterToSpell_DnD5eCharacter] FOREIGN KEY([CharacterID])
REFERENCES [dbo].[DnD5eCharacter] ([CharacterID])
GO
ALTER TABLE [dbo].[DnD5eCharacterToSpell] CHECK CONSTRAINT [FK_DnD5eCharacterToSpell_DnD5eCharacter]
GO
ALTER TABLE [dbo].[DnD5eCharacterToSpell]  WITH CHECK ADD  CONSTRAINT [FK_DnD5eCharacterToSpell_DnD5eSpells] FOREIGN KEY([SpellID])
REFERENCES [dbo].[DnD5eSpells] ([SpellID])
GO
ALTER TABLE [dbo].[DnD5eCharacterToSpell] CHECK CONSTRAINT [FK_DnD5eCharacterToSpell_DnD5eSpells]
GO
ALTER TABLE [dbo].[DnD5eCharacterToWeapons]  WITH CHECK ADD  CONSTRAINT [FK_DnD5eCharacterToWeapons_Character] FOREIGN KEY([CharacterID])
REFERENCES [dbo].[DnD5eCharacter] ([CharacterID])
GO
ALTER TABLE [dbo].[DnD5eCharacterToWeapons] CHECK CONSTRAINT [FK_DnD5eCharacterToWeapons_Character]
GO
ALTER TABLE [dbo].[DnD5eCharacterToWeapons]  WITH CHECK ADD  CONSTRAINT [FK_DnD5eCharacterToWeapons_DnD5eWeapons] FOREIGN KEY([WeaponID])
REFERENCES [dbo].[DnD5eWeapons] ([WeaponID])
GO
ALTER TABLE [dbo].[DnD5eCharacterToWeapons] CHECK CONSTRAINT [FK_DnD5eCharacterToWeapons_DnD5eWeapons]
GO
ALTER TABLE [dbo].[DnD5eClassFeatures]  WITH CHECK ADD  CONSTRAINT [FK_DnD5eClassFeatures_DnD5eClass] FOREIGN KEY([ClassID])
REFERENCES [dbo].[DnD5eClass] ([ClassID])
GO
ALTER TABLE [dbo].[DnD5eClassFeatures] CHECK CONSTRAINT [FK_DnD5eClassFeatures_DnD5eClass]
GO
ALTER TABLE [dbo].[DnD5eClassFeatures]  WITH CHECK ADD  CONSTRAINT [FK_DnD5eClassFeatures_DnD5eSubclass] FOREIGN KEY([SubClassID])
REFERENCES [dbo].[DnD5eSubclass] ([SubclassID])
GO
ALTER TABLE [dbo].[DnD5eClassFeatures] CHECK CONSTRAINT [FK_DnD5eClassFeatures_DnD5eSubclass]
GO
ALTER TABLE [dbo].[DnD5eClassSkillProf]  WITH CHECK ADD  CONSTRAINT [FK_DnD5eClassSkillProf_DnD5eClass] FOREIGN KEY([ClassID])
REFERENCES [dbo].[DnD5eClass] ([ClassID])
GO
ALTER TABLE [dbo].[DnD5eClassSkillProf] CHECK CONSTRAINT [FK_DnD5eClassSkillProf_DnD5eClass]
GO
ALTER TABLE [dbo].[DnD5eClassSkillProf]  WITH CHECK ADD  CONSTRAINT [FK_DnD5eClassSkillProf_DnD5eSkills] FOREIGN KEY([SkillID])
REFERENCES [dbo].[DnD5eSkills] ([SkillID])
GO
ALTER TABLE [dbo].[DnD5eClassSkillProf] CHECK CONSTRAINT [FK_DnD5eClassSkillProf_DnD5eSkills]
GO
ALTER TABLE [dbo].[DnD5eClassToSpell]  WITH CHECK ADD  CONSTRAINT [FK_DnD5eClassToSpell_DnD5eClass] FOREIGN KEY([ClassID])
REFERENCES [dbo].[DnD5eClass] ([ClassID])
GO
ALTER TABLE [dbo].[DnD5eClassToSpell] CHECK CONSTRAINT [FK_DnD5eClassToSpell_DnD5eClass]
GO
ALTER TABLE [dbo].[DnD5eClassToSpell]  WITH CHECK ADD  CONSTRAINT [FK_DnD5eClassToSpell_DnD5eSpells] FOREIGN KEY([SpellID])
REFERENCES [dbo].[DnD5eSpells] ([SpellID])
GO
ALTER TABLE [dbo].[DnD5eClassToSpell] CHECK CONSTRAINT [FK_DnD5eClassToSpell_DnD5eSpells]
GO
ALTER TABLE [dbo].[DnD5eSubclass]  WITH CHECK ADD  CONSTRAINT [FK_DnD5eSubclass_DnD5eClass] FOREIGN KEY([ClassID])
REFERENCES [dbo].[DnD5eClass] ([ClassID])
GO
ALTER TABLE [dbo].[DnD5eSubclass] CHECK CONSTRAINT [FK_DnD5eSubclass_DnD5eClass]
GO
ALTER TABLE [dbo].[DnD5eSubrace]  WITH CHECK ADD  CONSTRAINT [FK_DnD5eSubrace_DnD5eRaces] FOREIGN KEY([RaceID])
REFERENCES [dbo].[DnD5eRaces] ([RaceID])
GO
ALTER TABLE [dbo].[DnD5eSubrace] CHECK CONSTRAINT [FK_DnD5eSubrace_DnD5eRaces]
GO
ALTER TABLE [dbo].[DnD5eWeaponstoProperties]  WITH CHECK ADD  CONSTRAINT [FK_DnD5eWeaponstoProperties_DnD5eWeapons] FOREIGN KEY([WeaponID])
REFERENCES [dbo].[DnD5eWeapons] ([WeaponID])
GO
ALTER TABLE [dbo].[DnD5eWeaponstoProperties] CHECK CONSTRAINT [FK_DnD5eWeaponstoProperties_DnD5eWeapons]
GO
ALTER TABLE [dbo].[DnD5eWeaponstoProperties]  WITH CHECK ADD  CONSTRAINT [FK_DnD5eWeaponstoProperties_DnD5eWeaponstoProperties] FOREIGN KEY([WeaponPropertyID])
REFERENCES [dbo].[DnD5eWeaponProperties] ([WeaponPropertyID])
GO
ALTER TABLE [dbo].[DnD5eWeaponstoProperties] CHECK CONSTRAINT [FK_DnD5eWeaponstoProperties_DnD5eWeaponstoProperties]
GO
ALTER TABLE [dbo].[Player]  WITH CHECK ADD  CONSTRAINT [FK_Player_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Player] CHECK CONSTRAINT [FK_Player_Users]
GO
ALTER TABLE [dbo].[PlayerInGroup]  WITH CHECK ADD  CONSTRAINT [FK_PlayerInGroup_Player] FOREIGN KEY([PlayerID])
REFERENCES [dbo].[Player] ([PlayerID])
GO
ALTER TABLE [dbo].[PlayerInGroup] CHECK CONSTRAINT [FK_PlayerInGroup_Player]
GO
ALTER TABLE [dbo].[PlayerInGroup]  WITH CHECK ADD  CONSTRAINT [FK_PlayerInGroup_RPGGroup] FOREIGN KEY([GroupID])
REFERENCES [dbo].[RPGGroup] ([GroupID])
GO
ALTER TABLE [dbo].[PlayerInGroup] CHECK CONSTRAINT [FK_PlayerInGroup_RPGGroup]
GO
ALTER TABLE [dbo].[RPGGroup]  WITH CHECK ADD  CONSTRAINT [FK_RPGGroup_Player] FOREIGN KEY([GameMasterID])
REFERENCES [dbo].[Player] ([PlayerID])
GO
ALTER TABLE [dbo].[RPGGroup] CHECK CONSTRAINT [FK_RPGGroup_Player]
GO
ALTER TABLE [dbo].[RPGGroup]  WITH CHECK ADD  CONSTRAINT [FK_RPGGroup_Player1] FOREIGN KEY([GameTypeID])
REFERENCES [dbo].[Player] ([PlayerID])
GO
ALTER TABLE [dbo].[RPGGroup] CHECK CONSTRAINT [FK_RPGGroup_Player1]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Table to hold whether a user keyed to AdminID is an Admin.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Admin'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'All Characters must belong to a Game Type. ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Character', @level2type=N'COLUMN',@level2name=N'GameTypeID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Holds the basic information of a character shared amongst all implemented games' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Character'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Holds the information on backgrounds. This chosen at Character Creation. Likely need more tables to hold the items, skills, and languages given' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DnD5eBackground'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID to hold the race of a character' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DnD5eCharacter', @level2type=N'COLUMN',@level2name=N'RaceID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Determines Character Strength. Will never be above 100 in this system. Most characters it is between 1 and 20.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DnD5eCharacter', @level2type=N'COLUMN',@level2name=N'StrengthScore'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Characters Dexterity. Goes between 1 and 20. Will not be above 99.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DnD5eCharacter', @level2type=N'COLUMN',@level2name=N'DexterityScore'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Characters Con score. Normally 1 to 20. Will not be above 99.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DnD5eCharacter', @level2type=N'COLUMN',@level2name=N'ConstitutionScore'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Charisma Score. Will not be above 99. Usually 1 to 20.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DnD5eCharacter', @level2type=N'COLUMN',@level2name=N'CharismaScore'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Intelligence Score. Will not be above 99. Normally, 1 to 20.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DnD5eCharacter', @level2type=N'COLUMN',@level2name=N'IntelligenceScore'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Dexterity Score. Will not be above 99. Normally, 1 to 20.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DnD5eCharacter', @level2type=N'COLUMN',@level2name=N'WisdomScore'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Holds the characters Alignment. Can be changed. Will be combination of 2 characters like NG or CE.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DnD5eCharacter', @level2type=N'COLUMN',@level2name=N'Alignment'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Starts at 2 at level one and changes as a character leves up. Used when rolling checks.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DnD5eCharacter', @level2type=N'COLUMN',@level2name=N'ProfociencyBonus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The Current Level of the character. Called Total level because of Multiclassing and he separate Levels there.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DnD5eCharacter', @level2type=N'COLUMN',@level2name=N'TotalLevel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Current XP of the Character. ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DnD5eCharacter', @level2type=N'COLUMN',@level2name=N'CurrentXP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'XP needed per Level up. Increases as the Level Increases, but this can be static and will not be set by GMs or Characters.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DnD5eCharacter', @level2type=N'COLUMN',@level2name=N'XPNeededToLevelUp'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Holds the modifier for rolls using strength. Derived from the Score.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DnD5eCharacter', @level2type=N'COLUMN',@level2name=N'StrengthMod'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Holds the modifier for rolls using Dexterity. Derived from the Score.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DnD5eCharacter', @level2type=N'COLUMN',@level2name=N'DexterityMod'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Holds the modifier for rolls using Constitution. Derived from the Score.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DnD5eCharacter', @level2type=N'COLUMN',@level2name=N'ConstitutionMod'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Holds the modifier for rolls using Charisa. Derived from the Score.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DnD5eCharacter', @level2type=N'COLUMN',@level2name=N'CharismaMod'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Holds the modifier for rolls using Wisdom. Derived from the Score.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DnD5eCharacter', @level2type=N'COLUMN',@level2name=N'WisdomMod'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Holds the modifier for rolls using Intelligence. Derived from the Score.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DnD5eCharacter', @level2type=N'COLUMN',@level2name=N'IntelligenceMod'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Total Hitpoints. Changes on Level up and in other Rare Circumstances.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DnD5eCharacter', @level2type=N'COLUMN',@level2name=N'HitPointsTotal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Current HP. Cannot be set below 0. ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DnD5eCharacter', @level2type=N'COLUMN',@level2name=N'CurrentHitPoints'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Cannot be below 0.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DnD5eCharacter', @level2type=N'COLUMN',@level2name=N'Speed'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Set at character creation, but can be editted.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DnD5eCharacter', @level2type=N'COLUMN',@level2name=N'PersonalityTraits'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Can be editted. Set at Ideals.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DnD5eCharacter', @level2type=N'COLUMN',@level2name=N'Ideals'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Set at Character Creation. Can be editted.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DnD5eCharacter', @level2type=N'COLUMN',@level2name=N'Bonds'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Can be editted. Set at Character Creation.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DnD5eCharacter', @level2type=N'COLUMN',@level2name=N'Flaws'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Holds other proficiencies and languages the character knows.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DnD5eCharacter', @level2type=N'COLUMN',@level2name=N'ProficienciesAndLanguages'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Stores Height of Character. Not used in calculations' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DnD5eCharacter', @level2type=N'COLUMN',@level2name=N'Height'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Not used in calculations' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DnD5eCharacter', @level2type=N'COLUMN',@level2name=N'Weight'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Not used in calculations' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DnD5eCharacter', @level2type=N'COLUMN',@level2name=N'Eyes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Not used in calculations' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DnD5eCharacter', @level2type=N'COLUMN',@level2name=N'Skin'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Not used in calculations' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DnD5eCharacter', @level2type=N'COLUMN',@level2name=N'Hair'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Not used in calculations. Can be editted.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DnD5eCharacter', @level2type=N'COLUMN',@level2name=N'AlliesAndOrganizatons'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Cannot go below 0. Highest Value Coinage' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DnD5eCharacter', @level2type=N'COLUMN',@level2name=N'GoldAmount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Cannot go below 0. 5e for 1g. 10s to 1g.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DnD5eCharacter', @level2type=N'COLUMN',@level2name=N'ElectrumAmount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'10c to 1s' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DnD5eCharacter', @level2type=N'COLUMN',@level2name=N'SiverAmount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Cannot go below 0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DnD5eCharacter', @level2type=N'COLUMN',@level2name=N'FirstLevelSpellSlots'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Cannot go below 0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DnD5eCharacter', @level2type=N'COLUMN',@level2name=N'SecondLevelSpellSlots'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Cannot go below 0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DnD5eCharacter', @level2type=N'COLUMN',@level2name=N'ThirdLevelSpellSlots'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Cannot go below 0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DnD5eCharacter', @level2type=N'COLUMN',@level2name=N'FourthLevelSpellSlots'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Cannot go below 0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DnD5eCharacter', @level2type=N'COLUMN',@level2name=N'FifthLevelSpellSlots'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Cannot go below 0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DnD5eCharacter', @level2type=N'COLUMN',@level2name=N'SixthLevelSpellSlots'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Cannot go below 0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DnD5eCharacter', @level2type=N'COLUMN',@level2name=N'SeventhLevelSpellSlots'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Cannot go below 0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DnD5eCharacter', @level2type=N'COLUMN',@level2name=N'EighthLevelSpellSlots'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Cannot go below 0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DnD5eCharacter', @level2type=N'COLUMN',@level2name=N'NinthLevelSpellSlots'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Cannot go below 0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DnD5eCharacter', @level2type=N'COLUMN',@level2name=N'SpellsKnown'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Cannot go below 0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DnD5eCharacter', @level2type=N'COLUMN',@level2name=N'CantripsKnown'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Table holds the Information specific to DnD characters that are not in a many to many relationship' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DnD5eCharacter'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Holds a Characters Levels for any particular class. ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DnD5eCharacterToClass', @level2type=N'COLUMN',@level2name=N'ClassLevels'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Table Ties Character to its specific class' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DnD5eCharacterToClass'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ties a character to an items in their inventory' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DnD5eCharacterToItem'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ties a character to the spells they know.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DnD5eCharacterToSpell'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Holds the stats needed above 13 in order to multiclass. Stats are in full text form and delimited by commas if greater than 1 and will be seperated by "AND" or "OR" if both or 1 is needed' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DnD5eClass', @level2type=N'COLUMN',@level2name=N'MulticlassReq'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Holds Basic Class Information' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DnD5eClass'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Table that contains the level required of its class to gain this Feature or Ability' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DnD5eClassFeatures', @level2type=N'COLUMN',@level2name=N'RequiredClassLevel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Holds the information of what proficient skills a class has.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DnD5eClassSkillProf'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ties Character to the Spells they know' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DnD5eClassToSpell'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Holds the 3 character requisite stat for a character to have' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DnD5eFeats', @level2type=N'COLUMN',@level2name=N'StatPrerequisite'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Holds Basic Information for feats and may be checked.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DnD5eFeats'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Holds informaton for Items.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DnD5eItems'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Cannot go below 0. Normally 0, 1, or 2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DnD5eRaces', @level2type=N'COLUMN',@level2name=N'StrengthIncrease'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Cannot go below 0. Normally 0, 1, or 2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DnD5eRaces', @level2type=N'COLUMN',@level2name=N'DexterityIncrease'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Cannot go below 0. Normally 0, 1, or 2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DnD5eRaces', @level2type=N'COLUMN',@level2name=N'ConstitutionIncrease'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Cannot go below 0. Normally 0, 1, or 2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DnD5eRaces', @level2type=N'COLUMN',@level2name=N'WisdomIncrease'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Cannot go below 0. Normally 0, 1, or 2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DnD5eRaces', @level2type=N'COLUMN',@level2name=N'CharismaIncrease'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Cannot go below 0. Normally 0, 1, or 2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DnD5eRaces', @level2type=N'COLUMN',@level2name=N'IntelligenceIncrease'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Holds Information for classes. Can be used n character creation for adding bonuses to characters.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DnD5eRaces'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A single word detailing the School of magic this spell comes from' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DnD5eSpells', @level2type=N'COLUMN',@level2name=N'School'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Cannot go above 9. Range: 0 to 9. 0 is for Cantrip' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DnD5eSpells', @level2type=N'COLUMN',@level2name=N'SpellLevel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A string, usually in a combination of character "V" "S" "M". Usually combined within that order and separated by commas. There must always be one character.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DnD5eSpells', @level2type=N'COLUMN',@level2name=N'Components'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Text may need arsed and turned into rich text. May also need inputted as HTML or XML.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DnD5eSpells', @level2type=N'COLUMN',@level2name=N'SpellDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Holds Information about a spell. Would only be changed upon additon of new spells' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DnD5eSpells'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Usually Bludgeoning, Piercing, Slashing' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DnD5eWeapons', @level2type=N'COLUMN',@level2name=N'DamageType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A string that should be parsed to be <number of dice>d<dicetype>. number of dice is likely 1 or 2. And dice type is 4,6,8,10,12.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DnD5eWeapons', @level2type=N'COLUMN',@level2name=N'DamageDice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Holds the string for a stat like Strength or Dexterity.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DnD5eWeapons', @level2type=N'COLUMN',@level2name=N'AttackBonusStat'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'a small integer. Likely not below 0.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DnD5eWeapons', @level2type=N'COLUMN',@level2name=N'DamageModifier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Can be set for calculations against enemies (if the scope expands) to show that a weapon can be beyond resistance. For now it is just displayed in the itme window.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DnD5eWeapons', @level2type=N'COLUMN',@level2name=N'IsMagical'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Properties, Current would just be parsed for display). Though a separate table may be needed if we wish t display each of these.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DnD5eWeapons', @level2type=N'COLUMN',@level2name=N'Properties'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Weight of a single instance of the ite' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DnD5eWeapons', @level2type=N'COLUMN',@level2name=N'Weight'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates if a weapon is melee or range' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DnD5eWeapons', @level2type=N'COLUMN',@level2name=N'Melee'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Cost of a weapon (in copper pieces) So gold is div by 100, silver by 10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DnD5eWeapons', @level2type=N'COLUMN',@level2name=N'Cost'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Holds Information about weapons' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DnD5eWeapons'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Holds Descriptions of game type - Should also dictate in the app which tables/options are used for the character upon character creation.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Holds basic information a Player may wish to display ont heir user page' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Player'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Signifies if a Player is the GM of the group they are in. Group creation sets the User that created it to GM automatically. A GM can elevate a playr to GM. More than 1 GM can e in a group.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PlayerInGroup', @level2type=N'COLUMN',@level2name=N'IsGM'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ties the players to the groups they are in' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PlayerInGroup'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Relates to  a UserID that is the GM for the group. When set it should allow them to permission to change things, see all characters, etc. for that specific group.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RPGGroup', @level2type=N'COLUMN',@level2name=N'GameMasterID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Holds the GameType for that Group. String as Code. Holds a string like DND5e. Dictates what kind of characters are created for this group. Cannot be changed aftr group creation.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RPGGroup', @level2type=N'COLUMN',@level2name=N'GroupTitle'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Holds informtion for a group. In particular the dates for the next session, and the game type are of utmost important.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RPGGroup'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Is the user an admin (may make admin table redundant)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserPermissions', @level2type=N'COLUMN',@level2name=N'IsAdmin'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Can the user see or able to query all groups that are able (Admin privilege)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserPermissions', @level2type=N'COLUMN',@level2name=N'CanSeeAllGroups'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Does the user have access to Dashboards that holds metric of the webapps statistics (Total Number of Groups) (Groups with sessions in last 30 days), etc... (Optional Challenge of the project.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserPermissions', @level2type=N'COLUMN',@level2name=N'DashboardAccess'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Can Query to see all characters in existence.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserPermissions', @level2type=N'COLUMN',@level2name=N'CanSeeAllCharacters'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Can Edit Characters that belong to any user (Admin right)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserPermissions', @level2type=N'COLUMN',@level2name=N'CanEditAllCharacters'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'GM Right. Can Edit all Characters in their Group. (This may need to be tied to a particular Group ID in a separate Table)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserPermissions', @level2type=N'COLUMN',@level2name=N'CanEditAllCharactersInGroup'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Can Schedule Sessions for groups. Mostly for GMs.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserPermissions', @level2type=N'COLUMN',@level2name=N'CanScheduleGroup'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Can the user send an email to every user (Admin)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserPermissions', @level2type=N'COLUMN',@level2name=N'CanSendSitewideEmail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Every user should be able to create a character. ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserPermissions', @level2type=N'COLUMN',@level2name=N'CanChangeCharacterOwnership'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'GMs for their group, Admins.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserPermissions', @level2type=N'COLUMN',@level2name=N'CanRemovePlayerFromGroup'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Table holds bit (boolean) values to indicate if a particular user has the privileges to do certain things within the program' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserPermissions'
GO
USE [master]
GO
ALTER DATABASE [RPG_Group_Tracker] SET  READ_WRITE 
GO
