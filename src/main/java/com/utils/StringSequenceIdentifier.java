package com.utils;

import java.io.Serializable;
import java.util.Properties;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.hibernate.HibernateException;
import org.hibernate.MappingException;
import org.hibernate.Session;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.dialect.Dialect;
import org.hibernate.engine.jdbc.env.spi.JdbcEnvironment;
import org.hibernate.engine.spi.SessionImplementor;
import org.hibernate.engine.spi.SharedSessionContractImplementor;
import org.hibernate.id.Configurable;
import org.hibernate.id.IdentifierGenerator;
import org.hibernate.internal.util.config.ConfigurationHelper;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.type.Type;


//Vijay Rajgor 
//Return Sequence Value as String With Prefix 
/*eg.
 * @Id
@GenericGenerator(
        name = "assigned-sequence",
        strategy = "com.ict.sats.utility.StringSequenceIdentifier",
        parameters = {
                @org.hibernate.annotations.Parameter(
                        name = "sequence_name", value = "Your Oracle Sequence Name"),
                @org.hibernate.annotations.Parameter(
                        name = "sequence_prefix", value = "Prefix You Want to Give Before Id"),
})
@GeneratedValue(generator = "assigned-sequence", strategy = GenerationType.SEQUENCE)
*/

public class StringSequenceIdentifier implements IdentifierGenerator, Configurable {

    private String sequenceCallSyntax;
    private String prefix;
    @Override
    public void configure(Type type, Properties params, ServiceRegistry serviceRegistry) throws MappingException {
        final JdbcEnvironment jdbcEnvironment = serviceRegistry.getService(JdbcEnvironment.class);
        final Dialect dialect = jdbcEnvironment.getDialect();

        //final String sequencePerEntitySuffix = ConfigurationHelper.getString("", params, "");

        /*final String defaultSequenceName = ConfigurationHelper.getBoolean("Def", params, false)
                ? params.getProperty(JPA_ENTITY_NAME)// + sequencePerEntitySuffix
                : "";
*/
        String mySequenceString = ConfigurationHelper.getString("sequence_name", params, "");
        
        sequenceCallSyntax = dialect.getSequenceNextValString(mySequenceString);
        prefix = ConfigurationHelper.getString("sequence_prefix", params, "");
        //sequenceCallSyntax = dialect.getSequenceNextValString("HEALTH_MST_CHILD_SEQ");
        
    }

    @Override
    public Serializable generate(SharedSessionContractImplementor session, Object obj) {
       /* if (obj instanceof Identifiable) {
            Identifiable identifiable = (Identifiable) obj;
            Serializable id = identifiable.getId();
            if (id != null) {
                return id;
            }
        }*/
        long seqValue = ((Number) Session.class.cast(session)
            .createSQLQuery(sequenceCallSyntax)
            .uniqueResult()).longValue();

        return prefix+seqValue;
    }

}