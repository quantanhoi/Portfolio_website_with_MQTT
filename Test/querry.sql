-- Drop tables if they exist
DROP TABLE IF EXISTS skill;
DROP TABLE IF EXISTS project;
DROP TABLE IF EXISTS contact;

-- Create skill table
CREATE TABLE skill (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255)
);

-- Create project table
CREATE TABLE project (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  url VARCHAR(255),
  icon VARCHAR(2083)
);

-- Create contact table
CREATE TABLE contact (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  detail VARCHAR(255)
);

INSERT INTO skill (name) VALUES
('C/C++'),
('Javascript'),
('Node.js'),
('HTML, CSS'),
('Python'),
('Postgresql'),
('Jira, Trello');

INSERT INTO project (name, url, icon) VALUES
('URL Alias Store', 'https://github.com/quantanhoi/url_alias_store', 'https://previews.dropbox.com/p/thumb/ACDgmU_QYfZtQ0-XNN_VwN9Zq1Yi0J_vr1nmlMJEiP7Yqpq7iV8omdZzZDOj_C_Lxhqw6FVoPqMf2FrEI_IctCwtvDzHrASVmi7vA6sdllo6rUp3bm9QT29EQG2u7Skxr1IG8dmJR3fR5UQumqk7sBOwsay_734jpEQexznidrVDIPen4dYTc15tJWsYwBroOHLm4Y9A1uvETfg-zGU6eEkuaVkyisBSzJZbpctHJmABdIQRBR94ICCs1xrwPw_hVHp_UorX_GuSpNGRcKxrdETnwb2j34KVgtl3xQcpF89sitS2UUUNBTOB7Gd4hij1MM7JDAZnMGzI3sRybHTVH27T/p.png'),
('4x4 Gewinnt on Raspberry Pi', 'https://github.com/quantanhoi/4x4_gewinnt_mit_CoAp', 'https://previews.dropbox.com/p/thumb/ACDxHqXMtAapb2jaHaAEnmjKJe_jUeGI8iTi3I76zZG-i1E9AArRx8PFvt1u7Up-LNxwTO0i3zQHqVdLcb20DEFHILqkHVG_CejzNILN-QUQeptLfxieyGLVBNBaTliZpmhiUJD7AREZ5yhum6HVexMEKMadVGoh4fK8xrKt_1jLuYz4QJEkfBiYhYXdkva2SrMemQaikFh9gK7poArKMJCV3NgD5fpzCDveSusbAy5wqact6YQA4LcHH13oLq35Y7OBtyInxXSChgDdxTOJiKVG0Q6KWU898po8MOdXHBH8chv0YXyOsxpNWx0DTeDkkl1KfQgfoWOeZO1z4r6zJB1n/p.png'),
('Distributed System with Javascript', 'https://github.com/quantanhoi/JS_Verteiltes_System', 'https://previews.dropbox.com/p/thumb/ACABZyzdGNJKOw72iuqO1o8pk9QzxAkt12TDuUvz7YKdu1IlCIVbB96fchJm3NNJNWy7oi7X-s3oWxSWmKhAiLgVGFY5_o8YCeQNG2vNditsYIyFLKNNXHLTIbrGmn_y7Ft5iExsEARn53CB_Om5ewBuzgF7t_PLLWsMnzAMtpeyl9qPU6H7BIM4j9z-IxcuZHETi5EPPAcRL4cck2ZYfVkEg4B9sGVkXLt0gQM5uNHXuWqVGSyLrTmbO-j3oRH0pn8FO-RMO-SnzqDs62-FxOeea_w-QB7QUMoPph8z6eVNIwGOldc3tl15BBsjruaEFO4GI4DDl_rk9N21Y33MjFJq/p.png');

INSERT INTO contact (name, detail) VALUES
('Mobile', '+49 1794159439'),
('Email', 'thieuquangtrung1999@gmail.com'),
('Facebook', 'https://www.facebook.com/thieuquang.trung.9'),
('Github', 'https://github.com/quantanhoi');