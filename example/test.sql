SELECT * FROM file_nodes WHERE project_id = $1 AND parent_id = $2 AND branch_id = $3
         """, project_id, parent_id, branch_id)
         else:
             row = await self._db.fetchrow("""
                INSERT INTO file_nodes (parent_id, project_id, data) VALUES ($1, $2, $3::jsonb) RETURNING *
                """, parent_id, project_id, json.dumps(data))
         
         return self._to_node(row) if row else None