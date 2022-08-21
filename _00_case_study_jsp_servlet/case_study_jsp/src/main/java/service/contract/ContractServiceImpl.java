package service.contract;

import model.Contract;
import model.ContractDetail;
import repository.contract.ContractRepositoryImpl;
import repository.contract.IContractRepository;

import java.sql.SQLException;
import java.util.List;

public class ContractServiceImpl implements IContractService {
    private IContractRepository contractRepository = new ContractRepositoryImpl();

    @Override
    public void insertContract(Contract contract) throws SQLException {
        contractRepository.insertContract(contract);
    }

    @Override
    public void insertContractDetail(ContractDetail contractDetail) throws SQLException {
       contractRepository.insertContractDetail(contractDetail);
    }

    @Override
    public Contract selectContract(int id) {
        return null;
    }

    @Override
    public List<Contract> selectAllContract() {
        return contractRepository.selectAllContract();
    }
}
