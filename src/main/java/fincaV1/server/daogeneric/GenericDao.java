package fincaV1.server.daogeneric;

public interface GenericDao {

	public <T> T getAll(final Class<T> type);

	public <T> T get(final Class<T> type, final int id);

	public <T> String saveOrUpdate(final T o);

	public <T> String delete(final T o);
	
    public <T> int save(final T o);


}
