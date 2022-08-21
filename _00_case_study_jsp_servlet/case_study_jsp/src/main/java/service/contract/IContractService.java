package service.contract;

import model.*;

import java.sql.SQLException;
import java.util.List;

public interface IContractService {
    void insertContract(Contract contract) throws SQLException;

    void insertContractDetail(ContractDetail contractDetail) throws SQLException;

    Contract selectContract(int id);

    List<Contract> selectAllContract();

}
