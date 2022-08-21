package repository.contract;

import model.Contract;
import model.ContractDetail;

import java.sql.SQLException;
import java.util.List;

public interface IContractRepository {
    void insertContract(Contract contract) throws SQLException;

    void insertContractDetail(ContractDetail contractDetail) throws SQLException;

    Contract selectContract(int id);

    List<Contract> selectAllContract();
}
