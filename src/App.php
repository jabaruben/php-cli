<?php

namespace src;

use src\Database\Interfaces\Database;
use src\Database\Queries;
use Exception;

class App
{
    protected $querySearch;
    protected $db;

    public function __construct(array $argv)
    {
        if (count($argv) !== 2 || $argv[1] === "") {
            throw new Exception("Usage \"phpcli 'Search terms'\"");
        }
        $this->querySearch = $this->getOnlyThreeChars($this->sanitizeInput($argv[1]));
    }

    public function testSearchInDatabase(Database $db)
    {
        $results = [];
        try {
            $results = $db->Select("SELECT * FROM hotels;");
        } catch (Exception $e) {
            throw new Exception($e->getMessage());
        }
        echo "\nTest: \n";
        echo print_r($results, true);
    }

    public function searchInDatabase(Database $db): array
    {
        $resultsHotels = [];
        $resultsApartments = [];
        try {
            $resultsHotels = $this->searchHotelsInDatabase($db);
            $resultsApartments = $this->searchApartmentsInDatabase($db);
        } catch (Exception $e) {
            throw new Exception($e->getMessage());
        }
        $resultsJoined = $this->joinResults($resultsHotels, $resultsApartments);
        $resultsJoinedOrdered = $this->orderResultsAphabeticallyByName($resultsJoined);
        return $resultsJoinedOrdered;
    }

    public function printList(array $results): void
    {
        foreach ($results as $result) {
            $this->printLineFormated($result);
        }
    }

    private function printLineFormated(array $line): void
    {
        list(
            'type' => $type,
            'name' => $name,
            'city' => $city,
            'state' => $state,
            'country' => $country
        ) = $line;

        if ($type === "apartment") {
            list('how_many' => $param1, 'size' => $param2) = $line;
            $param1 .= " apartments";
            $param2 .= " people";
        } else {
            list('stars' => $param1, 'standar_room_type' => $param2) = $line;
            $param1 .= " stars";
        }

        $type = ucfirst(($type === "apartment") ? "{$type}s" : $type);

        echo "- {$type} {$name}, {$param1}, {$param2}, {$city}, {$state}, {$country}\n";
    }

    private function getOnlyThreeChars(string $input): string
    {
        return mb_substr($input, 0, 3);
    }

    private function searchHotelsInDatabase(Database $db): array
    {
        $results = [];
        try {
            $sqlQuery = Queries::$allHotelsWhereName;
            $sqlParams = ['search' => "{$this->querySearch}%"];
            $results = $db->Select($sqlQuery, $sqlParams);
        } catch (Exception $e) {
            throw new Exception($e->getMessage());
        }
        return $results;
    }

    private function searchApartmentsInDatabase(Database $db): array
    {
        $results = [];
        try {
            $sqlQuery = Queries::$allApartmentsWhereName;
            $sqlParams = ['search' => "{$this->querySearch}%"];
            $results = $db->Select($sqlQuery, $sqlParams);
        } catch (Exception $e) {
            throw new Exception($e->getMessage());
        }
        return $results;
    }

    private function joinResults(array ...$arraysToJoin): array
    {
        return array_merge(...$arraysToJoin);
    }

    private function orderResultsAphabeticallyByName(array $results): array
    {
        $sortFunction = function ($elem1, $elem2) {
            return $elem1['name'] <=> $elem2['name'];
        };
        return usort($results, $sortFunction) ? $results : [];
    }

    private function sanitizeInput(string $value): string
    {
        return filter_var($value, FILTER_SANITIZE_STRING);
    }
}
