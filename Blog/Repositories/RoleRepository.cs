using System.Collections.Generic;
using Blog.Models;
using Dapper.Contrib.Extensions;
using Microsoft.Data.SqlClient;

namespace Blog.Repositories
{
    public class RoleRepository
    {
          private SqlConnection _connection;

           public RoleRepository(SqlConnection connection)
               => _connection = connection; 

           public IEnumerable<Role> Get()
               =>  _connection.GetAll<Role>();

           public Role Get(int id)
               =>  _connection.Get<Role>(Id);
            
            public void Create(Role role)
               =>  _connection.Insert<Role>(role);
        
    }
}