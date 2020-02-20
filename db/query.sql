SELECT category.name as category, project.title as project, developer.name as developer from
project_categories category left join projects project on
category.category_id = project.category_id left join developers developer on
project.developer_id = developer.developer_id;

SELECT developer.name as developer, project.title as project from
developers developer left join projects project on
project.developer_id = developer.developer_id;