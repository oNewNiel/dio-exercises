CREATE TABLE `professor` (
  `professor_id` integer,
  `departamento_id` integer,
  `data_contratacao` timestamp
);

CREATE TABLE `departamento` (
  `departamento_id` integer PRIMARY KEY,
  `nome` varchar(255),
  `campus` varchar(255),
  `professor_id` integer,
  `data_criacao` timestamp
);

CREATE TABLE `curso` (
  `curso_id` integer PRIMARY KEY,
  `departamento_id` integer,
  `data_criacao` timestamp
);

CREATE TABLE `disciplina` (
  `disciplina_id` integer PRIMARY KEY,
  `departamento_id` integer,
  `data_inicio_inscricao` timestamp,
  `data_termino_inscricao` timestamp,
  `data_inicio_aulas` timestamp,
  `data_termino_aulas` timestamp
);

CREATE TABLE `disciplina_curso` (
  `disciplina_id` integer,
  `curso_id` integer
);

CREATE TABLE `prerequisito_disciplina` (
  `disciplina_id` integer,
  `prerequisito_id` integer
);

CREATE TABLE `prerequisito` (
  `prerequisito_id` integer PRIMARY KEY
);

CREATE TABLE `calendario` (
  `data` timestamp PRIMARY KEY
);

ALTER TABLE `disciplina_curso` ADD FOREIGN KEY (`disciplina_id`) REFERENCES `disciplina` (`disciplina_id`);

ALTER TABLE `disciplina_curso` ADD FOREIGN KEY (`curso_id`) REFERENCES `curso` (`curso_id`);

ALTER TABLE `professor` ADD FOREIGN KEY (`departamento_id`) REFERENCES `departamento` (`departamento_id`);

ALTER TABLE `departamento` ADD FOREIGN KEY (`departamento_id`) REFERENCES `disciplina` (`departamento_id`);

ALTER TABLE `departamento` ADD FOREIGN KEY (`departamento_id`) REFERENCES `curso` (`departamento_id`);

ALTER TABLE `disciplina` ADD FOREIGN KEY (`disciplina_id`) REFERENCES `prerequisito_disciplina` (`disciplina_id`);

ALTER TABLE `prerequisito_disciplina` ADD FOREIGN KEY (`prerequisito_id`) REFERENCES `prerequisito` (`prerequisito_id`);

ALTER TABLE `calendario` ADD FOREIGN KEY (`data`) REFERENCES `professor` (`data_contratacao`);

ALTER TABLE `calendario` ADD FOREIGN KEY (`data`) REFERENCES `departamento` (`data_criacao`);

ALTER TABLE `calendario` ADD FOREIGN KEY (`data`) REFERENCES `disciplina` (`data_inicio_aulas`);

ALTER TABLE `calendario` ADD FOREIGN KEY (`data`) REFERENCES `curso` (`data_criacao`);
