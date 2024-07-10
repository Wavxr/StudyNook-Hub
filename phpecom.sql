-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 10, 2024 at 04:48 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `phpecom`
--

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `user_id` int(11) NOT NULL,
  `prod_id` int(11) NOT NULL,
  `prod_qty` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `description` mediumtext NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `popular` tinyint(4) NOT NULL DEFAULT 0,
  `image` varchar(191) NOT NULL,
  `meta_title` varchar(191) NOT NULL,
  `meta_description` mediumtext NOT NULL,
  `meta_keywords` mediumtext NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `description`, `status`, `popular`, `image`, `meta_title`, `meta_description`, `meta_keywords`, `createdAt`) VALUES
(1, 'Productivity Software', 'productivity-software', 'Tools to enhance productivity, including office suites, note-taking applications, and task management software.', 0, 1, '1720351857.jpg', 'Best Productivity Software for Students | StudyNook Hub', 'Discover top productivity software for students, including office suites, note-taking apps, and task management tools at discounted prices.', 'productivity software, office suites, note-taking apps, task management, student software', '2024-06-16 15:25:21'),
(2, 'Educational Software', 'educational-software', 'Educational tools and platforms to support learning, including e-learning, language learning, and scientific simulations.', 0, 1, '1720368548.jpg', 'Top Educational Software for Students | StudyNook Hub', 'Explore the best educational software for students, featuring e-learning platforms, language learning tools, and science simulations at affordable prices.', 'educational software, e-learning, language learning, science simulations, student software', '2024-07-07 16:09:08'),
(3, 'Development Tools', 'development-tools', 'Essential tools for software development, including IDEs, version control systems, and database management software.', 0, 0, '1720530616.jpg', 'Essential Development Tools for Students | StudyNook Hub', 'Find top development tools for students, including IDEs, version control systems, and database management software at discounted prices.', 'development tools, IDEs, version control, database management, student software', '2024-07-09 13:10:16'),
(4, 'Design and Multimedia', 'design-multimedia', 'Creative software for graphic design, video editing, and 3D modeling to enhance multimedia projects.', 0, 0, '1720530665.png', 'Creative Design and Multimedia Software for Students | StudyNook Hub', 'Discover top design and multimedia software for students, including graphic design, video editing, and 3D modeling tools at affordable prices.', 'design software, multimedia software, graphic design, video editing, 3D modeling, student software', '2024-07-09 13:11:05'),
(5, 'Security and Antivirus', 'security-antivirus', 'Software to protect your devices and data, including antivirus programs, VPNs, and encryption tools.', 0, 0, '1720530700.jfif', 'Best Security and Antivirus Software for Students | StudyNook Hub', 'Ensure your data and devices are secure with top security and antivirus software for students, featuring antivirus programs, VPNs, and encryption tools at discounted prices.', 'security software, antivirus software, VPNs, encryption tools, student software', '2024-07-09 13:11:40'),
(6, 'Web Development', 'web-development', 'Software for building and managing websites, including web design tools, content management systems, and development frameworks.', 0, 0, '1720530823.png', 'Best Web Development Software for Students | StudyNook Hub', 'Find top web development software for students, featuring web design tools, content management systems, and development frameworks at affordable prices.', 'web development software, web design, content management systems, development frameworks, student software', '2024-07-09 13:13:43'),
(7, 'Data Analysis and Visualization', 'data-analysis-visualization', 'Tools for analyzing and visualizing data, including statistical software and data visualization platforms.', 0, 0, '1720530860.jpg', 'Top Data Analysis and Visualization Software for Students | StudyNook Hub', 'Discover the best data analysis and visualization software for students, featuring statistical software and data visualization platforms at discounted prices.', 'data analysis software, data visualization, statistical software, student software', '2024-07-09 13:14:20'),
(8, 'Creative Software', 'creative-software', 'Software for creative projects, including music production, animation, and photo editing tools.', 0, 0, '1720530890.webp', 'Best Creative Software for Students | StudyNook Hub', 'Explore top creative software for students, including music production, animation, and photo editing tools at affordable prices.', 'creative software, music production, animation, photo editing, student software', '2024-07-09 13:14:50');

-- --------------------------------------------------------

--
-- Table structure for table `item_orders`
--

CREATE TABLE `item_orders` (
  `id` int(11) NOT NULL,
  `prod_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `prod_qty` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `card_num` varchar(191) NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `item_orders`
--

INSERT INTO `item_orders` (`id`, `prod_id`, `user_id`, `prod_qty`, `price`, `card_num`, `order_date`) VALUES
(1, 1, 1, 1, 3700.00, '', '2024-07-03 02:00:00'),
(2, 2, 2, 1, 4230.00, '', '2024-07-04 03:00:00'),
(3, 3, 3, 1, 5200.00, '', '2024-07-05 04:00:00'),
(4, 4, 4, 1, 6450.00, '', '2024-07-06 05:00:00'),
(5, 5, 5, 1, 4300.00, '', '2024-07-07 06:00:00'),
(6, 5, 5, 1, 9050.00, '', '2024-07-08 06:00:00'),
(7, 5, 5, 1, 7400.00, '', '2024-07-09 06:00:00'),
(180, 1, 2, 1, 2500.00, '', '2024-07-09 16:13:17'),
(181, 8, 2, 1, 2600.00, '', '2024-07-09 16:47:57'),
(182, 1, 2, 1, 2500.00, '', '2024-07-09 16:48:34'),
(183, 1, 2, 1, 2500.00, '', '2024-07-09 16:50:37'),
(220, 52, 2, 1, 2600.00, '1283712893', '2024-07-10 14:35:11'),
(221, 54, 2, 1, 5100.00, '1283712893', '2024-07-10 14:35:11');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `small_description` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `original_price` decimal(10,2) NOT NULL,
  `selling_price` decimal(10,2) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `qty` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `trending` tinyint(1) NOT NULL DEFAULT 0,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `slug`, `small_description`, `description`, `original_price`, `selling_price`, `image`, `qty`, `status`, `trending`, `meta_title`, `meta_keywords`, `meta_description`, `created_at`, `updated_at`) VALUES
(1, 1, 'Alice', 'alice', 'Create multiple AI assistants, set up keyboard shortcuts, and integrate your favorite apps', 'People rave about all these new productivity hacks, but they don’t seem to make life any easier. (“So if I’m in the ice bath, who’s checking off my to-do list?”)\r\n\r\nEven though methods like the Pomodoro technique may help with time management, they’re not going to tackle the work for you.\r\n\r\nThat’s why you need a personal AI assistant that can do just about anything, from writing emails to scheduling meetings.', 3000.00, 2500.00, '1720356504.webp', 1, 0, 0, 'Alice - Create multiple AI assistants', 'AI, Productivity', 'Create multiple AI assistants, set up keyboard shortcuts, and integrate your favorite apps', '2024-07-07 12:11:26', '2024-07-10 14:46:10'),
(2, 5, 'Cyberangels One', 'cyberangels-one', 'Protect your business against any threat with this all-in-one cybersecurity and compliance solution', 'No matter how careful you try to be, failing to properly secure your business can impact your wallet and reputation. (“They saw me coming—I mean, uploading.”)\r\n\r\nBut most cyber security methods are complicated and expensive, making them super challenging to adopt into your team’s workflow.\r\n\r\nIf only there was an all-in-one cybersecurity solution that could highlight vulnerabilities and help you fix them with a fun, gamified approach.\r\n\r\nIntroducing Cyberangels One.', 2850.00, 2500.00, '1720534384.webp', 1, 0, 0, '', '', '', '2024-07-09 14:13:04', '2024-07-10 14:46:10'),
(3, 5, 'Human Presence', 'human-presence', 'Human Presence stops form spam on WordPress without reCaptcha.\r\n', 'Stop WordPress form spam bots on all your favorite form builders. Bot and automated WordPress spam are growing threats and headaches for the WordPress community. Whether it is comment spam or automated contact form spam, it’s incredibly annoying and can be detrimental to the company’s website & customers. Over the years, developers and the WordPress team have developed plugins to fight spam including Recaptcha, Akismet Anti-Spam, Honeypot, and more. The issue that arises with most of these platforms is that they do not work well on all WordPress websites, and spammers have figured out ways around their systems. And this is the core reason why we developed Human Presence for WordPress.\r\n\r\n', 3000.00, 2500.00, '1720534585.webp', 1, 0, 0, '', '', '', '2024-07-09 14:16:25', '2024-07-10 14:46:10'),
(4, 5, 'Online', 'online', 'Uptime monitoring service for web artisans: what matters most is a reliable website.', 'Uptime monitoring service for web artisans: what matters most is a reliable website.', 3000.00, 2500.00, '1720534722.webp', 1, 0, 0, '', '', '', '2024-07-09 14:18:42', '2024-07-10 14:46:10'),
(5, 2, 'Press Ranger', 'press-ranger', 'An AI PR tool that makes finding journalists and getting good press automatic\r\n', 'Good press is the #1 business growth hack - but how do you actually get it?\r\n\r\nPress Ranger\'s database of 500,000+ global journalists and publishers makes it easy to find and pitch the people actively writing about companies like yours.', 3000.00, 2500.00, '1720535094.webp', 1, 0, 0, '', '', '', '2024-07-09 14:24:54', '2024-07-10 14:46:10'),
(6, 1, 'Voila Norbert', 'voila-norbert', 'The most accurate email finder on the market according to Ahrefs -- up to a 98% success rate', 'Email Finder by Voila Norbert revolutionizes your outreach by ensuring you connect with real people, enhancing your business opportunities and relationships through effective email communication.\r\n\r\nWhether youre in sales, marketing, or recruitment, Voila Norbert simplifies the process of finding and verifying email addresses to improve your outreach success.', 2800.00, 2500.00, '1720535178.webp', 1, 0, 0, '', '', '', '2024-07-09 14:26:18', '2024-07-10 14:46:10'),
(7, 2, 'Sales Prophet', 'sales-prophet', 'Sales Prophet is an advanced email platform with unlimited access to 78 million B2B contact records\r\n', 'Sales Prophet is the only all-in-one sales and marketing automation platform providing B2B sales executives and lead generation agencies unlimited access to over 78 million contract records (leads) and a robust email automation engine with an easy-to-use CRM.\r\n\r\nSales automation platforms are great for lead generation, but what about demand generation?\r\n\r\nSales Prophet is the only platform that combines B2B data with the ability to send both sales sequences and mass emails for content syndication, which is ideal for demand-generation programs.\r\n\r\nWe are OAuth certified for both Google and Microsoft, which means you get one-click integration with a secure connection.', 2800.00, 2300.00, '1720535436.webp', 1, 0, 0, '', '', '', '2024-07-09 14:30:36', '2024-07-10 14:46:10'),
(8, 2, 'FlyMSG', 'flymsg', 'FlyMSG: an AI Writer, Text Expander, AI Post Generator & LinkedIn Commenting SUPER Productivity App!\r\n', 'With the latest release, FlyMSG AI comes alive. FlyMSG AI contains a series of micro-products including FlyEngage AI, FlyPosts AI, and others that are soon to be launched. Each of these tools can be leveraged in your plan.\r\n\r\nFlyMSG works as an extension on your browser and is powered by Google AI Palm 2 (Powering Bard) & Microsoft Azure Open AI (ChatGPT 4, GPT 3 and GPT 3.5). It’s more than magical; it’s super fly!\r\n\r\nCreate your own snippets or shortcuts (we call them FlyCuts), email templates, messaging snippets, inMail messages and more... Now you can store them all in the cloud! And leverage over 200 FlyPlates (messaging templates) for any occasion that you can choose from to use anywhere online.\r\n\r\nWith just a few short keystrokes FlyMSG will autopopulate forms, fields, emails, social media, Slack messages, or you fill in the blank, and you’ll be saving an hour a day.', 3000.00, 2600.00, '1720535477.webp', -1, 0, 0, '', '', '', '2024-07-09 14:31:17', '2024-07-10 13:15:44'),
(9, 3, 'Sizzy', 'sizzy', 'Test responsive designs faster with this browser built for web developers', 'It’s almost funny that you’re trying to build a super fast website when your own browser is weighed down by 70 open tabs. (“Trust me, closing them would also slow me down.”)\r\n\r\nWith all your work spread across multiple devices, browsers, and conditions, you’re bound to make a mistake and give some bad actor the power to break your site.\r\n\r\nWish there was a browser created specifically for web development that let you access all your tools from one place?\r\n\r\nIntroducing Sizzy.', 3000.00, 2300.00, '1720535649.webp', 1, 0, 0, '', '', '', '2024-07-09 14:34:09', '2024-07-10 14:46:10'),
(10, 1, 'test', 'test', 'test', 'test', 123.00, 123.00, '1720365572.webp', 0, 0, 1, 'test', 'tests', 'test', '2024-07-07 15:19:32', '2024-07-10 14:46:38'),
(13, 1, 'Frank AI', 'frank-ai', 'Frank AI is a blazingly fast iOS and web app that lets you use the latest AI models from your pocket', 'Frank AI is a model aggregator for iOS that lets you use the latest AI models in your phone – for creating, working, or finding information.\r\n\r\nIt supports GPT-4 Turbo and comes with the first ever iOS GPT-4 Keyboard Extension.\r\n\r\nUsers love Frank because of his ease-of-use, speed, and context understanding - no matter what model you use.\r\n\r\nOur mission with Frank is making prompting and interacting with complex AI models easier for everyone, so everyone can get value from the powerful tools that come out every day.', 2800.00, 2500.00, '1720532249.webp', 1, 0, 0, '', '', '', '2024-07-09 13:37:29', '2024-07-10 14:46:10'),
(14, 1, 'ZeroWork', 'zero-work', 'Automate browser activity like typing, clicking, and copy-pasting with AI-powered RPA', 'There’s nothing like spending your day scouring LinkedIn, sending cold DMs, and bantering with strangers. (“This is basically professional brain rot.”)\r\n\r\nBetween copy-pasting data, filling out forms, and managing social media activity, you’re trudging through grunt work every day.\r\n\r\nWhat if you could build code-free automations designed to tackle any menial workflow, without getting flagged for bot activity?', 2800.00, 2500.00, '1720532330.webp', 1, 0, 0, '', '', '', '2024-07-09 13:38:50', '2024-07-10 14:46:10'),
(15, 8, 'Ocoya', 'ocoya', 'Upgrade your content marketing strategy with an all-in-one AI-powered platform', 'It’s easy to lose track of all your social media accounts, especially when you’re juggling multiple brands. (“Please don’t tell me I accidentally posted my thirst trap to the corporate Instagram.”)\r\n\r\nAnd while there are plenty of tools out there to help you design and schedule posts, they take a ton of time and effort to master.\r\n\r\nWish you could ease the grunt work and manage all your content marketing in one place?\r\n\r\nIt’s possible with Ocoya.', 2800.00, 2500.00, '1720532382.webp', 1, 0, 0, '', '', '', '2024-07-09 13:39:42', '2024-07-09 14:02:27'),
(16, 7, 'Databar', 'databar', 'Use this AI scraper and data enrichment platform to supercharge your CRM and automate prospecting', 'Nothing says bummer summer like spending all your time inside prowling LinkedIn for new customers. (“Sun’s out, 85 profile tabs out.”)\r\n\r\nWhile prospecting, qualifying leads, and updating your CRM is vital for sales, doing it all manually would take over your entire workday.\r\n\r\nWhat if there was a tool that helped you automate data enrichment with high-quality data from high-quality sources, sprinkled with AI and custom formulas?', 2800.00, 2500.00, '1720532431.webp', 1, 0, 0, '', '', '', '2024-07-09 13:40:31', '2024-07-09 14:02:40'),
(17, 1, 'TidyCal', 'tidycal', 'Seamlessly manage your calendar and get more bookings using this powerful scheduling tool', 'Most calendar tools are weighed down by complicated features you’ll never need. (“I’m not sure what ‘round robin’ is but it sounds messy.”)\r\n\r\nWorst of all, you’re paying monthly subscription fees to access features you aren’t actually using.\r\n\r\nWish there was one simple tool that made it easy to book meetings, get paid, and manage your calendar?\r\n\r\nMeet TidyCal.', 2800.00, 2500.00, '1720532503.webp', 1, 0, 0, '', '', '', '2024-07-09 13:41:43', '2024-07-10 14:46:10'),
(18, 8, 'Layerpath', 'layerpath', 'Create interactive product demos and videos in a snap with this AI-powered platform', 'Capturing your product in action can feel like you’re trying to take a picture of the moon. (“My iPhone isn’t doing this justice.”)\r\n\r\nTruth is, it takes a lot of time to stage, record, edit, and publish demos that would inspire more prospects to convert.\r\n\r\nWish there was an AI-powered platform that let you create sleek product tours, guides, and videos in just minutes?\r\n\r\nMeet Layerpath.', 2800.00, 2500.00, '1720532584.webp', 1, 0, 0, '', '', '', '2024-07-09 13:43:04', '2024-07-09 14:02:11'),
(19, 1, 'Afforai', 'afforai', 'Use this AI research assistant to search, summarize, and translate your research', 'Trying to find reliable sources can feel like a weird side quest on your journey to mastering a new topic. (“Oh no, I’m sinking into a Reddit rabbit hole.”)\r\n\r\nWith so much information available out there, it’s nearly impossible to research anything without running into iffy sources.\r\n\r\nWhat if you had an AI research assistant that could analyze hundreds of documents and URLs to provide accurate answers?\r\n\r\nSay hello to Afforai.', 2850.00, 2300.00, '1720533050.webp', 1, 0, 0, '', '', '', '2024-07-09 13:50:50', '2024-07-10 14:46:10'),
(20, 7, 'AITable.ai', 'aitable-ai', 'Build your own spreadsheet-style databases for better project management and CRMs', 'When you’re managing big projects, you need tools that have a lot of wiggle room. \r\n\r\nBut because so many tools on the market are stubbornly inflexible, you end up managing projects and customer data with patchwork solutions. (“This platform is great...for single-tasking.”)\r\n\r\nWish there was one platform that uses AI to build the kind of databases you need to support all your tasks and customer relationships?', 2800.00, 2300.00, '1720533095.webp', 1, 0, 0, '', '', '', '2024-07-09 13:51:35', '2024-07-10 14:46:10'),
(21, 8, 'Junia AI', 'junia-ai', 'Generate high-ranking content that drives more traffic to your site with this powerful AI writing tool', 'Even if you are crafting blog posts day in and day out, search engines can still pass you by. (“Pick me, choose me, list me.”)\r\n\r\nWith so many different SEO tips and tricks out there, it’s impossible to know what’s working, what isn’t, and when you need to pivot your content strategy.\r\n\r\nIf only there was an AI-powered writing tool that could help you whip up content that drives organic traffic to your site.\r\n\r\nMeet Junia AI.', 3000.00, 2600.00, '1720533153.webp', 1, 0, 0, '', '', '', '2024-07-09 13:52:33', '2024-07-09 13:52:33'),
(22, 1, 'Pickaxe', 'pickaxe', 'Build, deploy, and monetize AI tools without writing a line of code', 'Nowadays, it seems like everyone and their mom is using some kind of AI tool for work. (“So she can use AI, but she can’t figure out FaceTime?”)\r\n\r\nThis would be the perfect time to launch your own AI tool, but building it from scratch is a nightmare—and monetizing it is even worse.\r\n\r\nIf only there was a platform that let you build, deploy, and monetize your own AI tool without touching a line of code.\r\n\r\nSay hello to Pickaxe.', 3000.00, 2300.00, '1720533215.webp', 1, 0, 0, '', '', '', '2024-07-09 13:53:35', '2024-07-10 14:46:10'),
(23, 4, 'Fable', 'fable', 'Create interactive demos and step-by-step guides to drive more conversions', 'Explaining how your product works to prospects can feel like a bad game of Pictionary. (“Let me paint you a picture. Oops, I messed up.”)\r\n\r\nTruth is, lengthy support documents and random product screenshots simply can’t showcase what sets your product apart.\r\n\r\nYou need a tool that makes it easy to create interactive demos that are tailored to each customer.\r\n\r\nIntroducing Fable.', 2850.00, 2500.00, '1720533267.webp', 1, 0, 0, '', '', '', '2024-07-09 13:54:27', '2024-07-10 14:46:10'),
(24, 3, 'U-xer', 'u-xer', 'Automate repetitive tasks with a tool combining computer vision, LLM, and RPA software\r\n', 'It’s hard to think big picture about your business when you’re drowning in repetitive tasks and busy work. (“Sorry, can’t talk now. Gotta sort my files into folders. Yes, again.”)\r\n\r\nAnd since you’re not a developer, figuring out how to automate simple actions like clicking and typing is way beyond your skill level.\r\n\r\nWish there was a user-friendly automation builder that combined computer vision, LLM, and RPA software to automate any task in a snap?\r\n\r\nSay hello to U-xer.', 2850.00, 2600.00, '1720533405.webp', 1, 0, 0, '', '', '', '2024-07-09 13:56:45', '2024-07-10 14:46:10'),
(25, 2, 'Merlin', 'merlin', 'Use this 26-in-one Chrome extension to research, summarize, and write content from your browser', 'It’s hard to believe AI tools help you work smarter when you’re still stuck switching between tabs to get things done. (“Just call me an AI assistant juggler.”)\r\n\r\nWith so many AI models and features on the market, you’re using way too much tech to research and generate different types of content.\r\n\r\nWhat if there was a Chrome extension packed with all the AI models you need to speed up your research and content creation process?\r\n\r\nSay hello to Merlin.', 2650.00, 1500.00, '1720534124.webp', 1, 0, 0, '', '', '', '2024-07-09 14:08:44', '2024-07-10 14:46:10'),
(26, 2, 'Unifire.ai', 'unifire', 'Transform your content into 30+ formats in minutes with this AI content repurposing platform', 'Constantly coming up with new content ideas can feel like you’re stuck reinventing the wheel. (“My bad for getting it right the first time.”)\r\n\r\nSince you’re only using each piece of content once, all the hours you’re pouring into strategizing and perfecting posts don’t add up to much.\r\n\r\nWish there was a platform that let you convert your best work into over 30 content assets that you can reuse on multiple platforms?\r\n\r\nSay hello to Unifire.ai.', 5300.00, 2400.00, '1720534223.webp', 1, 0, 0, '', '', '', '2024-07-09 14:10:23', '2024-07-10 14:46:10'),
(27, 6, 'North Commerce', 'north-commerce', 'Use this WordPress plugin to build a fast, easily customizable ecommerce site packed with features', 'It’s hard to build an ecommerce store when you’re dealing with tons of buggy plugins that don’t fit together. (Ironic, considering they all have a puzzle icon...)\r\n\r\nWith so many moving pieces, you need a way to do it all—from designing product pages and streamlining your checkout process to managing orders.\r\n\r\nLucky for you, there’s a WordPress plugin that’s packed with all the tools you need to create, manage, and scale your ecommerce business.\r\n\r\nCheck out North Commerce.', 2850.00, 2500.00, '1720534307.webp', 1, 0, 0, '', '', '', '2024-07-09 14:11:47', '2024-07-10 14:46:10'),
(36, 3, 'Monday Hero', 'monday-hero', 'Turn Figma, Adobe XD, and Sketch designs into functional Swift and Flutter code in minutes', 'Unfortunately, building your custom app isn’t as easy as typing furiously on your keyboard. (“Okay, so I don’t have a finished product, but I do have carpal tunnel.”)\r\n\r\nEven if you’ve already got your designs in hand, creating a functional, well-designed app can take hundreds of hours.\r\n\r\nWish you had a powerful tool that could transform your UI designs into functional code in minutes, not months?\r\n\r\nGive it up for Monday Hero.', 2800.00, 2600.00, '1720535686.webp', 1, 0, 0, '', '', '', '2024-07-09 14:34:46', '2024-07-10 14:46:10'),
(37, 6, 'DivMagic', 'div-magic', 'Copy design from any website, copy code of any web element with one click, and even convert formats\r\n', 'Tired of spending endless hours replicating web designs and elements across different formats? DivMagic is your ultimate solution for streamlined web development and design.\r\n\r\nWith DivMagic, you can effortlessly capture web elements from any website and convert them into reusable web components, whether you need HTML, CSS, React, JSX, or Tailwind CSS.\r\n\r\nSay goodbye to tedious design replication and hello to efficient, creative element conversion with DivMagic.\r\n\r\nWith one-click conversion and style copying, it\'s your shortcut to faster and easier web development and design.', 2850.00, 2500.00, '1720535719.webp', 1, 0, 0, '', '', '', '2024-07-09 14:35:19', '2024-07-10 14:46:10'),
(38, 6, 'Onetab AI', 'onetab-ai', 'Simplify development work with real-time chat, API testing, and continuous integration and deployment\r\n', 'Today’s fast-paced digital environment practically forces you to pile on dev tools in your already cluttered workspace. (“Is there a digital version of Hoarders? There should be.”)\r\n\r\nThing is, you need multiple tools to develop, test, and deploy projects, but getting bogged down by tabs is draining your productivity.\r\n\r\nThat’s why you need a platform that integrates all your tools in one comprehensive environment designed for modern development teams.\r\n\r\nIntroducing Onetab AI.', 2850.00, 2500.00, '1720535773.webp', 1, 0, 0, '', '', '', '2024-07-09 14:36:13', '2024-07-10 14:46:10'),
(39, 3, 'CodeMate', 'codemate', 'Write, debug, and refactor code faster with this AI pair programmer\r\n', 'Even if you’re an experienced coder, writing error-free code gets stressful fast. (“I might as well rename my variables ‘hopeThisWorks’ and ‘pleaseDontBreak.’”)\r\n\r\nYou simply don’t have the time to search through complex codebases and then refactor, debug, document, and write test cases for every line of code all by yourself.\r\n\r\nWish there was a tool that could help you whip up bug-free code and give you personalized AI responses to all your queries related to your code in record time?\r\n\r\nMake way for CodeMate AI.', 2800.00, 2500.00, '1720535803.webp', 1, 0, 0, '', '', '', '2024-07-09 14:36:43', '2024-07-10 14:46:10'),
(40, 6, 'Sheet2DB', 'sheet2b', 'Transform spreadsheets into a JSON API\r\n', 'Google Sheets is a powerhouse for organizing data, but bridging it to your website or mobile app can be a daunting task.\r\n\r\nYou\'re well-versed in its capabilities, but pulling that data into your digital platforms seamlessly?\r\n\r\nThat\'s where the challenge lies.\r\n\r\nWith Sheet2DB, you can seamlessly convert your Google Sheets into a dynamic JSON API, empowering you to effortlessly integrate your data into your website or mobile app.', 2800.00, 2500.00, '1720535834.webp', 1, 0, 0, '', '', '', '2024-07-09 14:37:14', '2024-07-10 14:46:10'),
(41, 3, 'Editor.do', 'editor-do', 'The all-in-one online IDE and host to create, code, and deploy stunning static websites in seconds\r\n', 'Editor.do is an all-in-one online IDE and hosting solution.\r\n\r\nIt allows you to create, code, host and deploy stunning & fast static websites in seconds with extraordinary ease of use.', 2850.00, 2500.00, '1720535872.webp', 1, 0, 0, '', '', '', '2024-07-09 14:37:52', '2024-07-10 14:46:10'),
(42, 4, 'FocuSee', 'focusee', 'Turn screen recordings into stunning videos automatically in minutes. Compatible with Mac & Windows.', 'Struggling to create an eye-catching promo, demo, or tutorial video? Are you tired of spending hours editing your recordings to make them attractive?\r\n\r\nIntroducing FocuSee, the screen recorder that automates the process, turning your screen recordings into stunning videos in just a minute.\r\n\r\nWith FocuSee, you\'ll save precious hours and effort on video editing, allowing you to focus on creating compelling content.', 2800.00, 2500.00, '1720536025.webp', 1, 0, 0, '', '', '', '2024-07-09 14:40:25', '2024-07-10 14:46:10'),
(43, 4, 'FlexClip', 'flexclip', 'FlexClip is an all-in-one web tool for recording and creating videos, movies, slideshows in minutes', 'You can cut a clip from your video quickly and make it far more dynamic with the combination of text and voice recordings.\r\n\r\nFlexClip’s powerful editing tools allow you to take full control over the video appearance, background music, and more. It enables you to save unlimited projects and create an unlimited number of videos with a premium account.\r\n\r\nSome of its key features include an easy-to-use and clean interface, a vast library of stock images, videos, and music, stunning video templates to boost your creativity, support for various photo and video formats, flexible editing features such as trimming, splitting, adding text/animations/overlays/transitions, music, and custom watermarks. Additionally, you can upload custom fonts and export videos in high resolutions.\r\n\r\nFlexClip meets all your needs in creating professional videos for business and occasions. What\'s more, it\'s very easy to use. Why not have a try?', 3000.00, 2500.00, '1720536049.webp', 1, 0, 0, '', '', '', '2024-07-09 14:40:49', '2024-07-10 14:46:10'),
(44, 4, 'Vmaker AI', 'vmaker-ai', 'Use this AI-powered online video editor to turn raw footage into edited videos and clips', 'Creating video content seems like a straightforward process until you’re in the thick of post-production. (“I don’t have the patience or B-roll for this.”)\r\n\r\nEven if you’re keeping up with your filming schedule, it’s impossible to edit all that footage fast enough to stay relevant online.\r\n\r\nLuckily, there’s an AI-powered video editor that converts raw, unedited footage into engaging videos and teaser clips in only a few minutes.\r\n\r\nCut to Vmaker AI.', 2800.00, 2500.00, '1720536081.webp', 1, 0, 0, '', '', '', '2024-07-09 14:41:21', '2024-07-10 14:46:10'),
(45, 4, 'Puppetry', 'puppetry', 'Puppetry is the easiest way to create AI avatar talking head videos', 'Struggling to create engaging social media content can leave marketers in a constant battle for attention.\r\n\r\nPuppetry offers a dynamic solution by empowering social media marketers to craft talking head videos with ease. Turn images into talking spokesperson! Create a face, type a script, pick a voice, and Puppetry animates it. Its as easy as typing a sentence!\r\n\r\nGenerate presenters that resonate with your brand using Puppetrys intuitive interface, selecting from diverse characteristics to match your vision. With Puppetry, animate your presenters with text or audio to deliver your message, creating captivating content that stands out in crowded social feeds.\r\n\r\nLeverage Puppetrys image assets and animator tools to tailor your visuals, ensuring every piece of content is as unique as your brands voice. Educators have used Puppetry to enchant their classrooms, while creators find Puppetry crucial for growing their YouTube audience with unique content.\r\n\r\nPuppetry helps teachers, creators, and marketers create engaging short video content for classrooms and social media.', 3000.00, 2300.00, '1720536110.webp', 1, 0, 0, '', '', '', '2024-07-09 14:41:50', '2024-07-10 14:46:10'),
(46, 4, 'Libretto', 'libretto', 'Podcasting made simple -- record high quality audio & video, and edit like a doc on a text editor', 'Meet Libretto: a cutting-edge recording platform that simplifies podcasting and editing.\r\n\r\nOffering high-quality, separate audio and video tracks for each participant plus a backup cloud recording, Libretto ensures your content always sounds professional with features like live soundboards and automatic audio enhancements.', 2800.00, 2500.00, '1720536142.webp', 1, 0, 0, '', '', '', '2024-07-09 14:42:22', '2024-07-10 14:46:10'),
(47, 5, 'UptimeMonster', 'uptime-monster', 'Track website and server uptime, performance, and security with this all-in-one monitoring solution', 'Unless you’re a cybersecurity expert, you don’t need to know all the nitty gritty details about site monitoring tools. (“Apparently \'zero-day protection\' is a good thing??”)\r\n\r\nAnd you’re not just being bogged down by all this technical jargon—you’re also paying an arm and a leg for features you’ll never use.\r\n\r\nWish there was a simple monitoring tool that could alert you the moment your website or server hiccups, without all the fluff features?\r\n\r\nMeet UptimeMonster', 2800.00, 2500.00, '1720536297.webp', 1, 0, 0, '', '', '', '2024-07-09 14:44:57', '2024-07-10 14:46:10'),
(48, 5, 'Domain Monitor', 'domain-monitor', 'Domain Monitor is the all-in-one domain & website monitoring tool', 'Is your website down?\r\n\r\nWhen\'s your next domain expiring?\r\n\r\nThese are questions that as a business owner or even as a website developer, you shouldn\'t have to be constantly thinking about.\r\n\r\nDomain Monitor is the all-in-one domain & website monitoring tool.\r\n\r\nIt allows you to rest easy at night knowing that your domain and website are being monitored 24/7.\r\n\r\nWith our platform, you\'ll be able to add both \"domains\" and \"monitors.\"\r\n\r\nYou can also add team members and even status pages.\r\n\r\nWith Domain Monitor, choose from several notification channels, including: email, web, SMS, and Slack.\r\n\r\nSet your monitoring type and interval with ease, then get insights into website performance.\r\n\r\nDon\'t let website uptime checking and domain monitoring be a chore.\r\n\r\nUse our all-in-one suite of tools to help you save money and time.\r\n\r\nGet access to Domain Monitor today!', 2800.00, 2600.00, '1720536336.webp', 1, 0, 0, '', '', '', '2024-07-09 14:45:36', '2024-07-10 14:46:10'),
(49, 5, 'WP Force SSL', 'wp-force-ssl', 'Fix SSL problems & monitor the site in real-time to improve SEO & user experience\r\n', 'For years, a valid SSL certificate and a properly configured site have been an important SEO ranking factor! However, if you\'ve moved your site to a new hosting, changed the domain, or switched to HTTPS, getting everything configured properly is hard.\r\n\r\nWP Force SSL instantly solves all SSL problems! In addition, it provides real-time monitoring for the SSL certificate and the site, so you\'ll get notified if something\'s not working or if your certificate is about to expire.\r\n\r\nRedirecting HTTP content to HTTPS, checking the certificate, ensuring security headers are working are just some of the features you\'ll get. However, the real power lies in the Content Scanner! It checks every resource on every page on your site to find & remove mixed content errors, the silent SEO rank killers.\r\n\r\nControl all your sites and licenses, or fully rebrand the plugin without editing any code from the centralized Dashboard. Impress your clients by having a custom plugin that has your company name & logo.\r\n\r\nWP Force SSL works with all plugins, themes & hosting providers.\r\n\r\nFix all SSL problems while improving SEO and user experience.', 3000.00, 2500.00, '1720536374.webp', 1, 0, 0, '', '', '', '2024-07-09 14:46:14', '2024-07-10 14:46:10'),
(50, 6, 'PingSuite', 'ping-suite', 'Monitor the performance and functionality of your website and get notified when it goes down', 'Keeping your website up and functioning should not be a burden! Constantly refreshing and tailing logs are now a thing of the past!\r\n\r\nTrying to find which endpoint is failing and testing them one by one and analyzing logs would take a bunch of time. Instead, there should be a way to do everything in advance and you should only need to act when things are really going south.\r\n\r\nDatabases, Load balancers, HA Proxy, CDNs - website stacks are getting more and more complex nowadays!\r\n\r\nWhat if it was possible to test all aspects of your website from around the globe and get notified only when everything is really getting out of control?\r\n\r\nCheck out PingSuite.', 2850.00, 2600.00, '1720536420.webp', 1, 0, 0, '', '', '', '2024-07-09 14:47:00', '2024-07-10 14:46:10'),
(51, 7, 'HypeIndex AI', 'hyperindex-ai', 'Instant stock insights & settlement analysis; summarize today\'s financial news of your stock', 'Struggling to navigate the intricate world of market hype for stocks and cryptocurrencies?\r\n\r\nHypeIndex AI is the game-changer you\'ve been looking for!', 3000.00, 2300.00, '1720536483.webp', 1, 0, 0, '', '', '', '2024-07-09 14:48:03', '2024-07-09 14:48:03'),
(52, 7, 'Equitest', 'equitest', 'AI Business Valuation Software for Startups and Established Companies - CPAs, Accountants, Investors', 'Harness the power of Al to generate secure and accurate Business Valuation Reports for any business… Enter equitest.net, where you can discover, monitor, and optimize a business’s net worth in under 20 minutes…Without spending thousands of dollars on specialized firms or wasting a month doing all the legwork... Peace of Mind Roll out your next round of funding with sheer confidence using professional reports and complete peace of mind. Automate and Scale You’ll have the freedom to automate data-intensive manual tasks and focus on what you do best, scale your business! Reduce Errors Business appraisals can be time-taking, complex, and tricky, especially when done by hand. Reduce the chances of human error and streamline the process by using technological solutions. Loved By Startup founders Easily prepare the necessary financial documents to attract investors. Private investors Gauge a tech firm’s ability and how much of the equity should you secure against your investment. Business advisors Reduce chances of errors, accelerate your work and get more done. Certified Public Accountants Appraise businesses to facilitate the buying/selling. Contact us now and get a free consultation call with our founder, to discuss the value of your startup', 2850.00, 2600.00, '1720536516.webp', 1, 0, 0, '', '', '', '2024-07-09 14:48:36', '2024-07-10 14:45:10'),
(53, 7, 'AllInvestView', 'allinvest-view', 'AllInvestView is a web platform to track your investments in a single place', 'Manage your investment like the pros!\r\n\r\nYou can manage many asset classes (stocks, ETFs, mutual funds, ETFs, bonds...).\r\n\r\nEnjoy a dedicated fixed income module, dividend tracking, advanced portfolio analytics tax reporting, etc.\r\n\r\nTake control of your wealth journey! 🛤️\r\n\r\nOur app simplifies managing your owned portfolio: track performance, assess transactions, and plan ahead with ease.\r\n\r\nEmbrace a clearer path to long-term investment success.\r\n\r\nIntroducing: AllInvestView.', 2800.00, 1600.00, '1720536557.webp', 1, 0, 0, '', '', '', '2024-07-09 14:49:17', '2024-07-09 14:49:17'),
(54, 8, 'Pixelied', 'pixelied', 'Use this AI-powered design suite to create eye-catching graphics in minutes\r\n', 'Unless you’re the impostor in a game of Among Us (“I was in Medbay!”), standing out is a good thing—especially when it comes to images and designs.\r\n\r\nBut if you want graphics that stop the scroll, hiring an expensive designer or suffering through hours of Photoshop tutorials are usually your only options.\r\n\r\nIf only there was a cloud-based design suite packed with AI-powered image generation and editing features to help you showcase your brand.\r\n\r\nSay hello to Pixelied.', 3000.00, 2500.00, '1720536612.webp', 1, 0, 0, '', '', '', '2024-07-09 14:50:12', '2024-07-10 14:45:06'),
(55, 8, 'Creatica', 'creatica', 'Generate unlimited unique vector backgrounds with 50+ generators, and limitless customizations\r\n', 'Introducing Creatica: Your Ultimate Background Generator.\r\n\r\nCreatica simplifies background creation, offering unlimited unique vector backgrounds with just a few clicks.\r\n\r\nWhether it\'s for website enhancement, design mockups, or wallpaper creation, customize patterns and colors effortlessly.\r\n\r\nPlus, with no attribution required and weekly updates, you can stay ahead of the curve in your design endeavors.', 2850.00, 1600.00, '1720536638.webp', 1, 0, 0, '', '', '', '2024-07-09 14:50:38', '2024-07-09 14:50:38'),
(56, 8, 'Drawtify', 'drawtify', 'Online Illustrator & Vector Graphic Editor with Beautiful Templates and Design Elements', 'User-friendly Online illustrator & Vector Graphic Editor | Make Design Easier\r\n\r\nWe created Drawtify with the idea that anyone should be able to create professional-looking designs in minutes.\r\n\r\nIt brings some powerful tools for designers to draw what they want and gives many beautiful templates and design elements for non-designers to make a design quickly.\r\n\r\nWith our powerful vector design software, you can create beautiful graphics online for free, the solution includes SVG editor, animated logo maker, infographic maker, flyer maker, poster maker, YouTube banner maker, business card, vector logo maker, etc.\r\n\r\nDrawtify has a wealth of built-in design resources, such as high-quality editable design templates, elements (art texts, icons, shapes, infographic elements), and plug-ins (barcodes, charts, diagrams, map), 100M+ HD photos.', 3000.00, 2300.00, '1720536675.webp', 1, 0, 0, '', '', '', '2024-07-09 14:51:15', '2024-07-09 14:51:15'),
(57, 8, 'The Graphics', 'the-graphics', 'Grow your business... visually! The Graphics Creator is fast & easy, even without any design skills!', 'It\'s time to start growing your small business with beautiful graphics. You know you need them (the images you put up on your social media channels or website need to look professional), but getting started can be hard.\r\n\r\n\r\n\r\nIntroducing: The Graphics Creator by Laughingbird Software! A powerful, fun, and easy-to-use online tool that makes it hassle-free to create eBook and mockup images, Facebook ads, Logos, YouTube Channel Art Graphics, Blog and Social Media images, and even animated motion graphics or custom mascot characters!\r\n\r\n\r\n\r\nStart creating by customizing the unique, ready-made templates, or use a blank canvas and create your own masterpiece. Drag and drop in the built-in elements or any of the millions of searchable stock photos and videos (or import your own).\r\n\r\n\r\n\r\nGrow your business... visually! It\'s the fastest and most creative way to design the graphics your business needs.', 3000.00, 1600.00, '1720536724.webp', 1, 0, 0, '', '', '', '2024-07-09 14:52:04', '2024-07-09 14:52:04'),
(58, 8, 'Graficto', 'graficto', 'Create powerful smart infographics and visuals without any design skills', 'Create powerful smart infographics and visuals without any design skills.\r\n\r\nUnless you are a creative graphic designer, it is not easy to create a nice-looking infographic for a presentation, a coursework, or a blog post.\r\n\r\nGraficto is an easy to use infographic and smart visuals maker that allows you to create designs in seconds.\r\n\r\nGraficto has hundreds of professionally designed infographic templates for lists, processes, cycles, or even charts. All you have to do is select the template you like and start adding content.\r\n\r\nYour visual will dynamically change as you add, edit, remove items or change text and icons. You just have to focus on the content, Graficto will do the design.\r\n\r\nIf you are not happy with the default colors and fonts, Graficto has a ton of carefully selected color palettes and fonts to choose from. \r\n\r\nOnce you are done, you can quickly export the design in high resolution to various image and vector formats. Or it can be easily shared on any social media or platform with a public URL.\r\n\r\nMake ideas and data easy to understand with the perfect infographic in seconds.\r\n\r\nGet lifetime premium access to Graficto today!', 2800.00, 1600.00, '1720536752.webp', 1, 0, 0, '', '', '', '2024-07-09 14:52:32', '2024-07-09 14:52:32'),
(59, 7, 'Visitor Tracking', 'visitor-tracking', 'Track UNLIMITED websites. Funnel tracking, visitor streaming, conversion tracking and more!', 'Tired of generic analytics that don\'t show you exactly what each visitor on your site is doing?\r\n\r\nWith Visitor Tracking, you can keep close eyes on EXACTLY what is happening on your website, when SEO pages are getting picked up, and ultimately understand how you’re getting traffic.\r\n\r\nKey Features:\r\n\r\nVisitor Stream: Get full visibility into every single session. See each visitors location, session duration, pages visited, if they converted, & more\r\nWebsite Portfolio Tracking: Oversee all your sites in a unified dashboard, where key metrics surface automatically, sparing you from manually creating reports\r\nFunnel & Conversion Tracking: See where customers drop off in your funnel and track conversions with precision\r\nCustomer Journey: Trace the origins of your customers\' journey with your business & monitor all interactions with your site\r\nWe love our craft and put in all the details to make this a delightful platform to use every day as a way to keep tabs on your business.\r\n\r\nGrab lifetime access now & get unlimited websites on any plan :)', 2800.00, 2600.00, '1720536830.webp', 1, 0, 0, '', '', '', '2024-07-09 14:53:50', '2024-07-09 14:53:50'),
(60, 7, 'Invoiless', 'invoiless', 'Simplify Your Invoicing Tasks with Our All-in-One Invoicing Solution\r\n', 'An all-in-one platform to create, send, track and manage your invoices and get paid in no time.\r\n\r\nInvoiless helps small to medium business owners, freelancers, and developers to create, send, manage and keep track of all invoices in one place.\r\n\r\nFor small to medium businesses: Manage all of your invoices in one place. Let us handle your invoices, so you can focus on what matters most to your business.\r\n\r\nFor freelancers: Create & share invoices with your clients for ongoing or completed projects and get paid faster.\r\n\r\nFor developers: Designed to be integrated with any infrastructure. Connect your website or app with Invoiless API and start invoicing!\r\n\r\nIt\'s very easy to use, manage all of your invoices in one place with an intuitive interface that makes filling in an invoice fast and simple. Bring all of your invoices into one place from start to finish.\r\n\r\nGet paid faster, waste less time and provide a better experience to your customers. You created your business, now you need to use Invoiless!\r\n\r\nGet lifetime access to Invoiless today!', 2850.00, 2300.00, '1720536890.webp', 1, 0, 0, '', '', '', '2024-07-09 14:54:50', '2024-07-10 14:44:58');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `phone` int(11) NOT NULL,
  `password` varchar(191) NOT NULL,
  `role_as` tinyint(4) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `password`, `role_as`, `created_at`) VALUES
(1, 'John Waver Aguilar', 'johnveraguilar25@gmail.com', 2147483647, '123', 1, '2024-06-15 15:48:07'),
(2, 'Pedro', 'johnveraguilar2004@gmail.com', 2147483647, '123', 0, '2024-06-15 16:03:42'),
(3, 'John Doe', 'john@example.com', 0, '123', 0, '2024-07-09 12:53:54'),
(4, 'Jane Smith', 'jane@example.com', 0, '123', 0, '2024-07-09 12:53:54'),
(5, 'Alice Johnson', 'alice@example.com', 0, '123', 0, '2024-07-09 12:53:54');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_orders`
--
ALTER TABLE `item_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prod_id` (`prod_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `item_orders`
--
ALTER TABLE `item_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=222;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `item_orders`
--
ALTER TABLE `item_orders`
  ADD CONSTRAINT `item_orders_ibfk_1` FOREIGN KEY (`prod_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `item_orders_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
