-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 09 jan. 2024 à 14:48
-- Version du serveur : 10.4.28-MariaDB
-- Version de PHP : 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `laravel`
--

-- --------------------------------------------------------

--
-- Structure de la table `candidatures_formaions`
--

CREATE TABLE `candidatures_formaions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user` bigint(20) UNSIGNED NOT NULL,
  `formation` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `cycles`
--

CREATE TABLE `cycles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cycle` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `cycles`
--

INSERT INTO `cycles` (`id`, `cycle`) VALUES
(1, 'LICENCE'),
(2, 'MASTER'),
(3, 'CYCLE INGENIEUR');

-- --------------------------------------------------------

--
-- Structure de la table `departements`
--

CREATE TABLE `departements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `departement` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `departements`
--

INSERT INTO `departements` (`id`, `departement`) VALUES
(1, 'Genie-Informatique'),
(2, 'Reseaux & systemes');

-- --------------------------------------------------------

--
-- Structure de la table `documents`
--

CREATE TABLE `documents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `filename` varchar(255) NOT NULL,
  `filepath` varchar(255) NOT NULL,
  `user` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `feedback`
--

CREATE TABLE `feedback` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `feedback` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `formations`
--

CREATE TABLE `formations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nom_formation` varchar(255) NOT NULL,
  `departements_id` bigint(20) UNSIGNED NOT NULL,
  `periode_cycles_id` bigint(20) UNSIGNED NOT NULL,
  `cout_formation` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `formations`
--

INSERT INTO `formations` (`id`, `nom_formation`, `departements_id`, `periode_cycles_id`, `cout_formation`, `created_at`, `updated_at`) VALUES
(19, 'Génie Logiciel', 1, 7, 850000, NULL, NULL),
(20, 'Génie Logiciel', 1, 8, 850000, NULL, NULL),
(21, 'Génie Logiciel', 1, 9, 850000, NULL, NULL),
(22, 'Infographie et Multimédia', 1, 7, 850000, NULL, NULL),
(23, 'Infographie et Multimédia', 1, 8, 850000, NULL, NULL),
(24, 'Infographie et Multimédia', 1, 9, 850000, NULL, NULL),
(25, 'Informatique de Gestion', 1, 7, 850000, NULL, NULL),
(26, 'Informatique de Gestion', 1, 8, 850000, NULL, NULL),
(27, 'Informatique de Gestion', 1, 9, 850000, NULL, NULL),
(37, 'Géomatique Et Développement d application', 1, 7, 850000, NULL, NULL),
(38, 'Géomatique Et Développement d application', 1, 8, 850000, NULL, NULL),
(39, 'Géomatique Et Développement d application', 1, 9, 850000, NULL, NULL),
(40, 'Génie Logiciel', 1, 10, 1200000, NULL, NULL),
(41, 'Génie Logiciel', 1, 11, 1200000, NULL, NULL),
(42, 'Informatique de Gestion', 1, 10, 1200000, NULL, NULL),
(43, 'Informatique de Gestion', 1, 11, 1200000, NULL, NULL),
(44, 'Data Science et Intelligence Artificielle', 1, 10, 1200000, NULL, NULL),
(57, 'Réseau Informatiques', 2, 7, 850000, NULL, NULL),
(58, 'Réseau Informatiques', 2, 8, 850000, NULL, NULL),
(59, 'Réseau Informatiques', 2, 9, 850000, NULL, NULL),
(60, 'Réseau Télécoms', 2, 7, 850000, NULL, NULL),
(61, 'Réseau Télécoms', 2, 8, 850000, NULL, NULL),
(62, 'Réseau Télécoms', 2, 9, 850000, NULL, NULL),
(63, 'Cyber Sécurité', 2, 7, 850000, NULL, NULL),
(64, 'Cyber Sécurité', 2, 8, 850000, NULL, NULL),
(65, 'Cyber Sécurité', 2, 9, 850000, NULL, NULL),
(66, 'Systèmes embarqués et IOT', 2, 7, 850000, NULL, NULL),
(67, 'Systèmes embarqués et IOT', 2, 8, 850000, NULL, NULL),
(68, 'Systèmes embarqués et IOT', 2, 9, 850000, NULL, NULL),
(69, 'Réseau Informatiques', 2, 10, 1200000, NULL, NULL),
(70, 'Réseau Informatiques', 2, 11, 1200000, NULL, NULL),
(71, 'Réseau Télécoms', 2, 10, 1200000, NULL, NULL),
(72, 'Réseau Télécoms', 2, 11, 1200000, NULL, NULL),
(73, 'Securité des Systèmes d Information et Monétiques', 2, 10, 1200000, NULL, NULL),
(74, 'Securité des Systèmes d Information et Monétiques', 2, 11, 1200000, NULL, NULL),
(75, 'Virtualisation et Cloud Computing', 2, 10, 1200000, NULL, NULL),
(76, 'Virtualisation et Cloud Computing', 2, 11, 1200000, NULL, NULL),
(77, 'Data Science et Intelligence Artificielle', 1, 11, 2500000, NULL, NULL),
(78, 'Securité des Systèmes d Information et Monétiques', 2, 11, 2500000, NULL, NULL),
(79, 'Monétiques', 2, 12, 2500000, NULL, NULL),
(80, 'Intelligence Artificielle', 2, 12, 2500000, NULL, NULL),
(81, 'Virtualisation et Cloud Computing', 2, 12, 2500000, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2024_01_05_125339_is_admin_user', 2),
(7, '2024_01_05_130414_add_column_is_admin_user', 3),
(8, '2024_01_05_130848_add_column_is_admin_user', 4),
(9, '2024_01_05_131443_add_column_is_admin_user', 5),
(10, '2024_01_05_131730_add_is_admin_to_users_table', 6),
(11, '2024_01_05_131942_add_column_is_admin_user', 7),
(12, '2024_01_05_151852_create_departements_table', 8),
(13, '2024_01_05_151956_create_cycles_table', 9),
(14, '2024_01_05_152121_create_periode_cycles_table', 10),
(15, '2024_01_05_153338_create_formations_table', 11),
(16, '2024_01_06_130825_create_validate_formations_table', 12),
(17, '2024_01_06_134406_add_columns__user', 13);

-- --------------------------------------------------------

--
-- Structure de la table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `periode_cycles`
--

CREATE TABLE `periode_cycles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cycle_periode` varchar(255) NOT NULL,
  `cycles_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `periode_cycles`
--

INSERT INTO `periode_cycles` (`id`, `cycle_periode`, `cycles_id`) VALUES
(7, 'LICENCE 1', 1),
(8, 'LICENCE 2', 1),
(9, 'LICENCE 3', 1),
(10, 'MASTER 1', 2),
(11, 'MASTER  2', 2),
(12, 'INGENIEUR', 3);

-- --------------------------------------------------------

--
-- Structure de la table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  `surname` varchar(100) DEFAULT NULL,
  `city_of_birth` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `phone_number` varchar(100) DEFAULT NULL,
  `sex` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `is_admin`, `surname`, `city_of_birth`, `country`, `phone_number`, `sex`) VALUES
(1, 'ADAMA ADAMA', 'nadamdiallo@gmail.com', NULL, '$2y$12$p2o3/XD6GOuAP61MR1y6LOfClBS9O1oyvVWTP92CqXDI9u8mm2Yyq', 'aJvUZSVOriCwN5xKJkuyLHzuZf8jiUBkh20MallAH7DXlSFjPdqvCA6XpXtb', '2024-01-02 20:52:16', '2024-01-02 20:52:16', 1, NULL, NULL, NULL, NULL, ''),
(2, 'moustoifa', 'kamal@gmail.com', NULL, '$2y$12$XDncw1TKc8KD42NAhsPYn.iWuPLEn/zn/bGl39OeucVO48tB7RZ9y', NULL, '2024-01-05 13:29:41', '2024-01-05 13:29:41', 0, NULL, NULL, NULL, NULL, '');

-- --------------------------------------------------------

--
-- Structure de la table `validate_documents`
--

CREATE TABLE `validate_documents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user` bigint(20) UNSIGNED NOT NULL,
  `document` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `validate_feedbacks`
--

CREATE TABLE `validate_feedbacks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `validate_feedback` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `validate_formations`
--

CREATE TABLE `validate_formations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user` bigint(20) UNSIGNED NOT NULL,
  `formation` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `validate_users_informations`
--

CREATE TABLE `validate_users_informations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `validate_users_information` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `candidatures_formaions`
--
ALTER TABLE `candidatures_formaions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user` (`user`),
  ADD KEY `formation` (`formation`);

--
-- Index pour la table `cycles`
--
ALTER TABLE `cycles`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `departements`
--
ALTER TABLE `departements`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user` (`user`);

--
-- Index pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Index pour la table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `formations`
--
ALTER TABLE `formations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `formations_periode_cycles_id_foreign` (`periode_cycles_id`),
  ADD KEY `departements_id` (`departements_id`);

--
-- Index pour la table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Index pour la table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Index pour la table `periode_cycles`
--
ALTER TABLE `periode_cycles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `periode_cycles_cycles_id_foreign` (`cycles_id`);

--
-- Index pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Index pour la table `validate_documents`
--
ALTER TABLE `validate_documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user` (`user`),
  ADD KEY `document` (`document`);

--
-- Index pour la table `validate_feedbacks`
--
ALTER TABLE `validate_feedbacks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user` (`user`);

--
-- Index pour la table `validate_formations`
--
ALTER TABLE `validate_formations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user` (`user`),
  ADD KEY `formation` (`formation`);

--
-- Index pour la table `validate_users_informations`
--
ALTER TABLE `validate_users_informations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user` (`user`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `candidatures_formaions`
--
ALTER TABLE `candidatures_formaions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `cycles`
--
ALTER TABLE `cycles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `departements`
--
ALTER TABLE `departements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `documents`
--
ALTER TABLE `documents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `formations`
--
ALTER TABLE `formations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT pour la table `periode_cycles`
--
ALTER TABLE `periode_cycles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `validate_documents`
--
ALTER TABLE `validate_documents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `validate_feedbacks`
--
ALTER TABLE `validate_feedbacks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `validate_formations`
--
ALTER TABLE `validate_formations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `validate_users_informations`
--
ALTER TABLE `validate_users_informations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `candidatures_formaions`
--
ALTER TABLE `candidatures_formaions`
  ADD CONSTRAINT `candidatures_formaions_ibfk_1` FOREIGN KEY (`user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `candidatures_formaions_ibfk_2` FOREIGN KEY (`formation`) REFERENCES `formations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `documents`
--
ALTER TABLE `documents`
  ADD CONSTRAINT `documents_ibfk_1` FOREIGN KEY (`user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `formations`
--
ALTER TABLE `formations`
  ADD CONSTRAINT `formations_ibfk_1` FOREIGN KEY (`departements_id`) REFERENCES `departements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `formations_periode_cycles_id_foreign` FOREIGN KEY (`periode_cycles_id`) REFERENCES `periode_cycles` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `periode_cycles`
--
ALTER TABLE `periode_cycles`
  ADD CONSTRAINT `periode_cycles_cycles_id_foreign` FOREIGN KEY (`cycles_id`) REFERENCES `cycles` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `validate_documents`
--
ALTER TABLE `validate_documents`
  ADD CONSTRAINT `validate_documents_ibfk_1` FOREIGN KEY (`user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `validate_documents_ibfk_2` FOREIGN KEY (`document`) REFERENCES `documents` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `validate_feedbacks`
--
ALTER TABLE `validate_feedbacks`
  ADD CONSTRAINT `validate_feedbacks_ibfk_1` FOREIGN KEY (`user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `validate_formations`
--
ALTER TABLE `validate_formations`
  ADD CONSTRAINT `validate_formations_ibfk_1` FOREIGN KEY (`user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `validate_formations_ibfk_2` FOREIGN KEY (`formation`) REFERENCES `formations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `validate_users_informations`
--
ALTER TABLE `validate_users_informations`
  ADD CONSTRAINT `validate_users_informations_ibfk_1` FOREIGN KEY (`user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
