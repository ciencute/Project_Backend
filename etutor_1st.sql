-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th3 22, 2020 lúc 10:26 AM
-- Phiên bản máy phục vụ: 10.4.11-MariaDB
-- Phiên bản PHP: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `etutor`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `course`
--

CREATE TABLE `course` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `course`
--

INSERT INTO `course` (`id`, `name`, `description`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES
(1, NULL, NULL, NULL, '2020-03-16 13:50:00', NULL, '2020-03-16 13:50:00'),
(2, 'c#', 'Hello', NULL, '2020-03-16 13:52:00', NULL, '2020-03-16 13:52:00'),
(3, 'c#d', 'Hello', NULL, '2020-03-16 13:53:00', NULL, '2020-03-16 13:53:00'),
(4, 'c#ddsad', 'Hello', NULL, '2020-03-16 13:54:00', NULL, '2020-03-16 13:54:00'),
(5, 'c#ddsaddsdsds', 'Hello', 1, '2020-03-16 13:56:00', NULL, '2020-03-16 13:56:00'),
(6, 'c#ddsaddsdsdsdsd', 'Hello', 1, '2020-03-16 14:02:00', NULL, '2020-03-16 14:02:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `documents`
--

CREATE TABLE `documents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `document_type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status_id` bigint(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `document_review`
--

CREATE TABLE `document_review` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `document_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `comment` varchar(250) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `document_share`
--

CREATE TABLE `document_share` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `document_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `document_type`
--

CREATE TABLE `document_type` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `descriptiom` varchar(200) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `meeting`
--

CREATE TABLE `meeting` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `link` text COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `start_at` datetime DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `status_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `meeting_attendance`
--

CREATE TABLE `meeting_attendance` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `meeting_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `message`
--

CREATE TABLE `message` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `from_user` bigint(20) UNSIGNED DEFAULT NULL,
  `to_user` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `status_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `roles`
--

INSERT INTO `roles` (`id`, `name`, `description`) VALUES
(1, 'admin', 'admin'),
(2, 'staff', 'staff'),
(3, 'tutor', 'tutor'),
(4, 'student', 'student');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `status`
--

CREATE TABLE `status` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `status`
--

INSERT INTO `status` (`id`, `name`, `description`) VALUES
(1, 'dat', 'dsadasd'),
(2, 'deleted', 'deleted'),
(3, 'seen', 'seen'),
(4, 'not seen', 'not seen'),
(5, 'marked', 'marked');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tutor_registrations`
--

CREATE TABLE `tutor_registrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tutor_id` bigint(20) UNSIGNED DEFAULT NULL,
  `student_id` bigint(20) UNSIGNED DEFAULT NULL,
  `course_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `from_date` datetime DEFAULT NULL,
  `to_date` datetime DEFAULT NULL,
  `status_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` int(11) DEFAULT NULL,
  `dob` datetime DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_id` int(11) DEFAULT NULL,
  `active` int(11) DEFAULT 1,
  `role_id` bigint(20) UNSIGNED NOT NULL DEFAULT 4
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `gender`, `dob`, `email`, `image`, `created_by`, `created_at`, `updated_by`, `updated_at`, `password`, `status_id`, `active`, `role_id`) VALUES
(1, 'dat', NULL, NULL, 'mynameisdat6@gmail.com', NULL, NULL, NULL, NULL, NULL, '$2y$10$wFk.ffaRm5NirbyQUpcAO.zy5UNVxJsL4Dp19OdDPg7WhQ9UdGEt6', NULL, 1, 1),
(2, 'dat2', NULL, NULL, 'mynameisdat2@gmail.com', NULL, NULL, NULL, NULL, NULL, '$2y$10$KwS/W.HMR9T10C3G6Gs3G.dCdVJrRhEE.JTbksPlFCjJNOCwQbXFC', NULL, 1, 1),
(3, 'dat3', NULL, NULL, 'mynameisdat3@gmail.com', NULL, NULL, NULL, NULL, NULL, '$2y$10$NWSxpuz7yfsxfWrfDRtKFur2MHZbpUJ99TxJ.kWZnfXFI2CnKe7l.', NULL, 1, 1),
(4, 'dat4', NULL, NULL, 'mynameisdat4@gmail.com', NULL, NULL, '2020-03-13 10:32:00', NULL, NULL, '$2y$10$uck79vDDIURb.QySny6UyurMmjDW5Lv3e9/soOXESS0TfEzTmqdcS', NULL, 1, 1),
(5, 'dat4', NULL, NULL, 'mynameisdat5@gmail.com', NULL, NULL, '2020-03-13 10:35:00', NULL, NULL, '$2y$10$ttRYJt79wF22L2tlHKOEnuG1MP.yiH7m.AAY9d4/Ho/QBWRPY7o9a', NULL, 1, 1),
(6, 'dat4', NULL, NULL, 'mynameisdat7@gmail.com', NULL, NULL, '2020-03-13 10:35:00', NULL, NULL, '$2y$10$N71MTTwIgM1uN74GXb1xa.O7C2WuM8S2z92E4o0wXbb6ojyKC8B2m', NULL, 1, 1),
(7, 'dat4', NULL, NULL, 'mynameisdat8@gmail.com', NULL, NULL, '2020-03-13 17:38:00', NULL, NULL, '$2y$10$CyYakz0TNz1nX3uL9zR3KuBd4bDL9JdI.CDrlgzUlHpLRAN6QnWoy', NULL, 1, 1),
(8, 'dat4', NULL, NULL, 'mynameisdat9@gmail.com', NULL, NULL, '2020-03-13 17:41:00', NULL, NULL, '$2y$10$NdTK51qB.oXfMX.AO1sZCumk0wmEjrO4bk659JwXwpqDmCRiZ4hN.', NULL, 1, 1),
(9, 'dat4', NULL, NULL, 'mynameisdat10@gmail.com', NULL, NULL, '2020-03-13 17:41:00', NULL, NULL, '$2y$10$2lN4vdfIKYZB9RyAOdjlVuO.F2e1PVsFdd/2zhz0irsOBNdHF.19S', NULL, 1, 1),
(10, 'dat4', NULL, NULL, 'mynameisdat11@gmail.com', NULL, NULL, '2020-03-13 17:45:00', NULL, NULL, '$2y$10$5SmGLM9uRaNj5neK7noB4O6I5RztrQmTr3nNA8L1jFGFYEDrQrHym', NULL, 1, 1),
(11, 'dat4', NULL, NULL, 'mynameisdat12@gmail.com', NULL, NULL, '2020-03-13 17:46:00', NULL, NULL, '$2y$10$ZCHAyWa.ZRIjzkkZMPmm7uqGIXzcHsXK.et7AOiLziRQGPYp8NgxO', NULL, 1, 1),
(12, 'dat4', NULL, NULL, 'mynameisdat13@gmail.com', NULL, NULL, '2020-03-13 17:47:00', NULL, '2020-03-13 17:47:00', '$2y$10$zzsW3TH3Lc.SzE9PqXqDweiV9s4sCofZTSLHx3yySTT5id4tF81ry', NULL, 1, 1),
(13, 'dat4', NULL, NULL, 'mynameisdat14@gmail.com', NULL, NULL, '2020-03-13 17:49:00', NULL, '2020-03-13 17:49:00', '$2y$10$JZrAZBiNCTNeeQFPf9uzVemjB402PqScEX22Pln/dzvyn1S5lcsBa', NULL, 1, 1),
(14, 'dat4', NULL, NULL, 'mynameisdat15@gmail.com', NULL, NULL, '2020-03-13 18:03:00', NULL, '2020-03-13 18:03:00', '$2y$10$S974HtKj69o6YYiMzqkiQux5dvBo9FZqgpv/ehqAYIzdIFreGBoi2', NULL, 1, 3),
(15, 'dat4', NULL, NULL, 'mynameisdat16@gmail.com', NULL, NULL, '2020-03-13 18:14:00', NULL, '2020-03-13 18:14:00', '$2y$10$287YBhWODzgllQpVhNYHVOJ4ef2XDOovP0B0VBWQvaAO4vS724FF.', NULL, 1, 1),
(16, 'dat4', NULL, NULL, 'mynameisdat17@gmail.com', NULL, NULL, '2020-03-14 22:25:00', NULL, '2020-03-14 22:25:00', '$2y$10$GP9een.oJ6W9FVnFiJW3Aebp6Ae5Elx799jcHpkA8Yybtkf7Mh5dS', NULL, 1, 3);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foreign_created_by` (`created_by`),
  ADD KEY `foreign_ipdated_by` (`updated_by`),
  ADD KEY `foeign_docuemnt_type` (`document_type_id`),
  ADD KEY `foerign_status` (`status_id`);

--
-- Chỉ mục cho bảng `document_review`
--
ALTER TABLE `document_review`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `document_share`
--
ALTER TABLE `document_share`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_share_document` (`document_id`,`user_id`),
  ADD KEY `foerign_share_with` (`user_id`);

--
-- Chỉ mục cho bảng `document_type`
--
ALTER TABLE `document_type`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `meeting`
--
ALTER TABLE `meeting`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foreign_created_by_meeting` (`created_by`),
  ADD KEY `foerign_status_id_meeting` (`status_id`);

--
-- Chỉ mục cho bảng `meeting_attendance`
--
ALTER TABLE `meeting_attendance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foregin_meeting_id_attendance` (`meeting_id`),
  ADD KEY `foreign_user_id_attendance` (`user_id`),
  ADD KEY `foreign_created_by_attendance` (`created_by`);

--
-- Chỉ mục cho bảng `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foreignkey_from_user` (`from_user`),
  ADD KEY `foreignkey_to_user` (`to_user`),
  ADD KEY `foerignkey_status_id` (`status_id`);

--
-- Chỉ mục cho bảng `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tutor_registrations`
--
ALTER TABLE `tutor_registrations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tutor_registrations_tutor_id_foreign` (`tutor_id`),
  ADD KEY `tutor_registrations_student_id_foreign` (`student_id`),
  ADD KEY `tutor_registrations_created_by_foreign` (`created_by`),
  ADD KEY `tutor_registrations_updated_by_foreign` (`updated_by`),
  ADD KEY `tutor_registrations_course_id_foreign` (`course_id`),
  ADD KEY `tutor_registrations_status_id_foreign` (`status_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `course`
--
ALTER TABLE `course`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `documents`
--
ALTER TABLE `documents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `document_review`
--
ALTER TABLE `document_review`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `document_share`
--
ALTER TABLE `document_share`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `document_type`
--
ALTER TABLE `document_type`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `meeting`
--
ALTER TABLE `meeting`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `meeting_attendance`
--
ALTER TABLE `meeting_attendance`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `message`
--
ALTER TABLE `message`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `status`
--
ALTER TABLE `status`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `tutor_registrations`
--
ALTER TABLE `tutor_registrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `documents`
--
ALTER TABLE `documents`
  ADD CONSTRAINT `foeign_docuemnt_type` FOREIGN KEY (`document_type_id`) REFERENCES `document_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `foerign_status` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `foreign_created_by` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `foreign_ipdated_by` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `document_share`
--
ALTER TABLE `document_share`
  ADD CONSTRAINT `foerign_document_id` FOREIGN KEY (`document_id`) REFERENCES `documents` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `foerign_share_with` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `meeting`
--
ALTER TABLE `meeting`
  ADD CONSTRAINT `foerign_status_id_meeting` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `foreign_created_by_meeting` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `meeting_attendance`
--
ALTER TABLE `meeting_attendance`
  ADD CONSTRAINT `foregin_meeting_id_attendance` FOREIGN KEY (`meeting_id`) REFERENCES `meeting` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `foreign_created_by_attendance` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `foreign_user_id_attendance` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `foerignkey_status_id` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `foreignkey_from_user` FOREIGN KEY (`from_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `foreignkey_to_user` FOREIGN KEY (`to_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `tutor_registrations`
--
ALTER TABLE `tutor_registrations`
  ADD CONSTRAINT `tutor_registrations_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tutor_registrations_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tutor_registrations_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tutor_registrations_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tutor_registrations_tutor_id_foreign` FOREIGN KEY (`tutor_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tutor_registrations_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
